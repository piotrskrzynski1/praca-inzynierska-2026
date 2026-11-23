//! Bezpieczny pamięciowo ECS z kolumnami komponentów pogrupowanymi w archetypy.
//!
//! Każda kolumna jest rzeczywistym `Vec<T>`. Wymazanie typu występuje tylko na
//! granicy archetypu; zapytanie odzyskuje typ raz, przed pętlą po komponentach.

use std::any::{type_name, Any, TypeId};
use std::collections::HashMap;
use std::fmt;

/// Komponent nie przechowuje pożyczonych danych i może być przesłany między wątkami.
pub trait Component: Any + Send + Sync {}
impl<T: Any + Send + Sync> Component for T {}

type Value = Box<dyn Any + Send + Sync>;
type ColumnFactory = fn() -> Box<dyn ErasedColumn>;

#[derive(Clone, Copy, Debug, Eq, PartialEq, Hash)]
pub struct Entity {
    pub index: u32,
    pub generation: u32,
}

#[derive(Clone, Debug, Eq, PartialEq)]
pub enum EcsError {
    StaleEntity(Entity),
    DuplicateComponent(&'static str),
    MissingComponent(&'static str),
    DuplicateQueryType(&'static str),
    CapacityExceeded,
}

impl fmt::Display for EcsError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::StaleEntity(e) => write!(f, "Nieaktualna lub nieistniejąca encja: {e:?}"),
            Self::DuplicateComponent(t) => write!(f, "Powtórzony komponent w pakiecie: {t}"),
            Self::MissingComponent(t) => write!(f, "Encja nie zawiera komponentu: {t}"),
            Self::DuplicateQueryType(t) => write!(f, "Zapytanie wymaga dwóch różnych typów: {t}"),
            Self::CapacityExceeded => write!(f, "Wyczerpano przestrzeń identyfikatorów encji"),
        }
    }
}
impl std::error::Error for EcsError {}

trait ErasedColumn: Send + Sync {
    fn as_any(&self) -> &dyn Any;
    fn as_any_mut(&mut self) -> &mut dyn Any;
    fn push(&mut self, value: Value);
    fn swap_remove(&mut self, row: usize) -> Value;
    fn swap_remove_drop(&mut self, row: usize);
}

struct TypedColumn<T: Component>(Vec<T>);
impl<T: Component> ErasedColumn for TypedColumn<T> {
    fn as_any(&self) -> &dyn Any {
        &self.0
    }
    fn as_any_mut(&mut self) -> &mut dyn Any {
        &mut self.0
    }
    fn push(&mut self, value: Value) {
        self.0
            .push(*value.downcast::<T>().expect("Niezgodny typ kolumny ECS"));
    }
    fn swap_remove(&mut self, row: usize) -> Value {
        Box::new(self.0.swap_remove(row))
    }
    fn swap_remove_drop(&mut self, row: usize) {
        self.0.swap_remove(row);
    }
}
fn make_column<T: Component>() -> Box<dyn ErasedColumn> {
    Box::new(TypedColumn::<T>(Vec::new()))
}

#[derive(Clone, Copy)]
struct Descriptor {
    id: TypeId,
    name: &'static str,
    factory: ColumnFactory,
}
impl Descriptor {
    fn of<T: Component>() -> Self {
        Self {
            id: TypeId::of::<T>(),
            name: type_name::<T>(),
            factory: make_column::<T>,
        }
    }
}
struct Entry {
    descriptor: Descriptor,
    value: Value,
}

/// Pakiet dowolnej liczby różnych typów komponentów.
#[derive(Default)]
pub struct Bundle {
    entries: Vec<Entry>,
}
impl Bundle {
    pub fn new() -> Self {
        Self::default()
    }
    pub fn with<T: Component>(mut self, component: T) -> Result<Self, EcsError> {
        if self
            .entries
            .iter()
            .any(|entry| entry.descriptor.id == TypeId::of::<T>())
        {
            return Err(EcsError::DuplicateComponent(type_name::<T>()));
        }
        self.entries.push(Entry {
            descriptor: Descriptor::of::<T>(),
            value: Box::new(component),
        });
        Ok(self)
    }
}

struct Column {
    descriptor: Descriptor,
    values: Box<dyn ErasedColumn>,
}
struct Archetype {
    /// Kolejność kolumn odpowiada posortowanym TypeId w kluczu archetypu.
    columns: Vec<Column>,
    entities: Vec<Entity>,
}
impl Archetype {
    fn new(descriptors: &[Descriptor]) -> Self {
        Self {
            columns: descriptors
                .iter()
                .map(|d| Column {
                    descriptor: *d,
                    values: (d.factory)(),
                })
                .collect(),
            entities: Vec::new(),
        }
    }
    fn column_index(&self, id: TypeId) -> Option<usize> {
        self.columns
            .binary_search_by_key(&id, |column| column.descriptor.id)
            .ok()
    }
    fn append(&mut self, entity: Entity, mut entries: Vec<Entry>) -> usize {
        entries.sort_unstable_by_key(|entry| entry.descriptor.id);
        debug_assert_eq!(entries.len(), self.columns.len());
        for (column, entry) in self.columns.iter_mut().zip(entries) {
            debug_assert_eq!(column.descriptor.id, entry.descriptor.id);
            column.values.push(entry.value);
        }
        let row = self.entities.len();
        self.entities.push(entity);
        row
    }
    fn extract(&mut self, row: usize) -> (Vec<Entry>, Option<Entity>) {
        let entries = self
            .columns
            .iter_mut()
            .map(|column| Entry {
                descriptor: column.descriptor,
                value: column.values.swap_remove(row),
            })
            .collect();
        self.entities.swap_remove(row);
        (entries, self.entities.get(row).copied())
    }
    fn remove_drop(&mut self, row: usize) -> Option<Entity> {
        for column in &mut self.columns {
            column.values.swap_remove_drop(row);
        }
        self.entities.swap_remove(row);
        self.entities.get(row).copied()
    }
}

#[derive(Clone, Copy)]
struct Location {
    archetype: usize,
    row: usize,
}
struct Slot {
    generation: u32,
    location: Option<Location>,
}

#[derive(Clone, Debug)]
pub struct ArchetypeStats {
    pub entities: usize,
    pub components: Vec<&'static str>,
}

/// Świat jest wyłącznym właścicielem encji i komponentów.
#[derive(Default)]
pub struct World {
    archetypes: Vec<Archetype>,
    archetype_index: HashMap<Vec<TypeId>, usize>,
    slots: Vec<Slot>,
    free_slots: Vec<u32>,
    entity_count: usize,
}
impl World {
    pub fn new() -> Self {
        Self::default()
    }
    pub fn len(&self) -> usize {
        self.entity_count
    }
    pub fn entity_count(&self) -> usize {
        self.entity_count
    }
    pub fn is_empty(&self) -> bool {
        self.entity_count == 0
    }
    /// Liczba utworzonych archetypów, włącznie z obecnie pustymi.
    pub fn archetype_count(&self) -> usize {
        self.archetypes.len()
    }
    pub fn is_alive(&self, entity: Entity) -> bool {
        self.location(entity).is_some()
    }

    fn location(&self, entity: Entity) -> Option<Location> {
        self.slots
            .get(entity.index as usize)
            .filter(|slot| slot.generation == entity.generation)
            .and_then(|slot| slot.location)
    }
    fn ensure_archetype(&mut self, mut descriptors: Vec<Descriptor>) -> usize {
        descriptors.sort_unstable_by_key(|d| d.id);
        let key: Vec<TypeId> = descriptors.iter().map(|d| d.id).collect();
        if let Some(&index) = self.archetype_index.get(&key) {
            return index;
        }
        let index = self.archetypes.len();
        self.archetypes.push(Archetype::new(&descriptors));
        self.archetype_index.insert(key, index);
        index
    }
    pub fn spawn(&mut self, bundle: Bundle) -> Result<Entity, EcsError> {
        let index = match self.free_slots.pop() {
            Some(index) => index,
            None => {
                let index =
                    u32::try_from(self.slots.len()).map_err(|_| EcsError::CapacityExceeded)?;
                self.slots.push(Slot {
                    generation: 0,
                    location: None,
                });
                index
            }
        };
        let entity = Entity {
            index,
            generation: self.slots[index as usize].generation,
        };
        let archetype = self.ensure_archetype(
            bundle
                .entries
                .iter()
                .map(|entry| entry.descriptor)
                .collect(),
        );
        let row = self.archetypes[archetype].append(entity, bundle.entries);
        self.slots[index as usize].location = Some(Location { archetype, row });
        self.entity_count += 1;
        Ok(entity)
    }
    pub fn spawn2<A: Component, B: Component>(&mut self, a: A, b: B) -> Result<Entity, EcsError> {
        self.spawn(Bundle::new().with(a)?.with(b)?)
    }
    fn extract(&mut self, location: Location) -> Vec<Entry> {
        let (entries, moved) = self.archetypes[location.archetype].extract(location.row);
        if let Some(moved) = moved {
            self.slots[moved.index as usize].location = Some(location);
        }
        entries
    }
    /// Zmienia archetyp encji, jeśli wcześniej nie zawierała danego typu.
    /// Zastąpienie istniejącego komponentu nie zmienia archetypu.
    pub fn insert<T: Component>(&mut self, entity: Entity, component: T) -> Result<(), EcsError> {
        let location = self.location(entity).ok_or(EcsError::StaleEntity(entity))?;
        if let Some(value) = self.get_mut::<T>(entity) {
            *value = component;
            return Ok(());
        }
        let descriptor = Descriptor::of::<T>();
        let mut descriptors: Vec<_> = self.archetypes[location.archetype]
            .columns
            .iter()
            .map(|c| c.descriptor)
            .collect();
        descriptors.push(descriptor);
        let target = self.ensure_archetype(descriptors);
        let mut entries = self.extract(location);
        entries.push(Entry {
            descriptor,
            value: Box::new(component),
        });
        let row = self.archetypes[target].append(entity, entries);
        self.slots[entity.index as usize].location = Some(Location {
            archetype: target,
            row,
        });
        Ok(())
    }
    pub fn remove<T: Component>(&mut self, entity: Entity) -> Result<T, EcsError> {
        let location = self.location(entity).ok_or(EcsError::StaleEntity(entity))?;
        let source = &self.archetypes[location.archetype];
        let removed_index = source
            .column_index(TypeId::of::<T>())
            .ok_or(EcsError::MissingComponent(type_name::<T>()))?;
        let descriptors = source
            .columns
            .iter()
            .filter(|c| c.descriptor.id != TypeId::of::<T>())
            .map(|c| c.descriptor)
            .collect();
        let target = self.ensure_archetype(descriptors);
        let mut entries = self.extract(location);
        let removed = entries.remove(removed_index).value;
        let row = self.archetypes[target].append(entity, entries);
        self.slots[entity.index as usize].location = Some(Location {
            archetype: target,
            row,
        });
        Ok(*removed
            .downcast::<T>()
            .expect("Niezgodny typ komponentu ECS"))
    }
    pub fn despawn(&mut self, entity: Entity) -> Result<(), EcsError> {
        let location = self.location(entity).ok_or(EcsError::StaleEntity(entity))?;
        let slot = &mut self.slots[entity.index as usize];
        slot.location = None;
        // Slot z najwyższą generacją jest wycofywany, aby uchwyt nigdy nie ożył po przepełnieniu.
        if let Some(next_generation) = slot.generation.checked_add(1) {
            slot.generation = next_generation;
            self.free_slots.push(entity.index);
        }
        self.entity_count -= 1;
        if let Some(moved) = self.archetypes[location.archetype].remove_drop(location.row) {
            self.slots[moved.index as usize].location = Some(location);
        }
        Ok(())
    }
    pub fn get<T: Component>(&self, entity: Entity) -> Option<&T> {
        let location = self.location(entity)?;
        let archetype = &self.archetypes[location.archetype];
        let column = &archetype.columns[archetype.column_index(TypeId::of::<T>())?];
        column
            .values
            .as_any()
            .downcast_ref::<Vec<T>>()?
            .get(location.row)
    }
    pub fn get_mut<T: Component>(&mut self, entity: Entity) -> Option<&mut T> {
        let location = self.location(entity)?;
        let archetype = &mut self.archetypes[location.archetype];
        let index = archetype.column_index(TypeId::of::<T>())?;
        archetype.columns[index]
            .values
            .as_any_mut()
            .downcast_mut::<Vec<T>>()?
            .get_mut(location.row)
    }
    pub fn count_with<T: Component>(&self) -> usize {
        self.archetypes
            .iter()
            .filter(|a| a.column_index(TypeId::of::<T>()).is_some())
            .map(|a| a.entities.len())
            .sum()
    }
    pub fn entities_with<T: Component>(&self) -> Vec<Entity> {
        self.archetypes
            .iter()
            .filter(|a| a.column_index(TypeId::of::<T>()).is_some())
            .flat_map(|a| a.entities.iter().copied())
            .collect()
    }
    pub fn for_each2<A: Component, B: Component>(
        &self,
        mut f: impl FnMut(Entity, &A, &B),
    ) -> Result<usize, EcsError> {
        if TypeId::of::<A>() == TypeId::of::<B>() {
            return Err(EcsError::DuplicateQueryType(type_name::<A>()));
        }
        let mut count = 0;
        for archetype in &self.archetypes {
            let (Some(a), Some(b)) = (
                archetype.column_index(TypeId::of::<A>()),
                archetype.column_index(TypeId::of::<B>()),
            ) else {
                continue;
            };
            let a = archetype.columns[a]
                .values
                .as_any()
                .downcast_ref::<Vec<A>>()
                .expect("Typ kolumny A");
            let b = archetype.columns[b]
                .values
                .as_any()
                .downcast_ref::<Vec<B>>()
                .expect("Typ kolumny B");
            let len = archetype.entities.len().min(a.len()).min(b.len());
            for ((entity, a), b) in archetype.entities[..len]
                .iter()
                .copied()
                .zip(&a[..len])
                .zip(&b[..len])
            {
                f(entity, a, b);
            }
            count += len;
        }
        Ok(count)
    }
    /// Iteruje po rozłącznych kolumnach. Kompilator sprawdza rozłączność przez split_at_mut.
    pub fn for_each2_mut<A: Component, B: Component>(
        &mut self,
        mut f: impl FnMut(Entity, &mut A, &mut B),
    ) -> Result<usize, EcsError> {
        if TypeId::of::<A>() == TypeId::of::<B>() {
            return Err(EcsError::DuplicateQueryType(type_name::<A>()));
        }
        let mut count = 0;
        for archetype in &mut self.archetypes {
            let (Some(a), Some(b)) = (
                archetype.column_index(TypeId::of::<A>()),
                archetype.column_index(TypeId::of::<B>()),
            ) else {
                continue;
            };
            let (a_column, b_column) = if a < b {
                let (left, right) = archetype.columns.split_at_mut(b);
                (&mut left[a], &mut right[0])
            } else {
                let (left, right) = archetype.columns.split_at_mut(a);
                (&mut right[0], &mut left[b])
            };
            let a = a_column
                .values
                .as_any_mut()
                .downcast_mut::<Vec<A>>()
                .expect("Typ kolumny A");
            let b = b_column
                .values
                .as_any_mut()
                .downcast_mut::<Vec<B>>()
                .expect("Typ kolumny B");
            let len = archetype.entities.len().min(a.len()).min(b.len());
            for ((entity, a), b) in archetype.entities[..len]
                .iter()
                .copied()
                .zip(&mut a[..len])
                .zip(&mut b[..len])
            {
                f(entity, a, b);
            }
            count += len;
        }
        Ok(count)
    }
    /// Iteruje bezpośrednio po dwóch rozłącznych kolumnach bez odczytu wektora encji.
    pub fn for_each2_values_mut<A: Component, B: Component>(
        &mut self,
        mut f: impl FnMut(&mut A, &mut B),
    ) -> Result<usize, EcsError> {
        if TypeId::of::<A>() == TypeId::of::<B>() {
            return Err(EcsError::DuplicateQueryType(type_name::<A>()));
        }
        let mut count = 0;
        for archetype in &mut self.archetypes {
            let (Some(a), Some(b)) = (
                archetype.column_index(TypeId::of::<A>()),
                archetype.column_index(TypeId::of::<B>()),
            ) else {
                continue;
            };
            let (a_column, b_column) = if a < b {
                let (left, right) = archetype.columns.split_at_mut(b);
                (&mut left[a], &mut right[0])
            } else {
                let (left, right) = archetype.columns.split_at_mut(a);
                (&mut right[0], &mut left[b])
            };
            let a = a_column
                .values
                .as_any_mut()
                .downcast_mut::<Vec<A>>()
                .expect("Typ kolumny A");
            let b = b_column
                .values
                .as_any_mut()
                .downcast_mut::<Vec<B>>()
                .expect("Typ kolumny B");
            let len = a.len().min(b.len());
            for (a, b) in a[..len].iter_mut().zip(&mut b[..len]) {
                f(a, b);
            }
            count += len;
        }
        Ok(count)
    }
    pub fn archetype_stats(&self) -> Vec<ArchetypeStats> {
        self.archetypes
            .iter()
            .map(|archetype| ArchetypeStats {
                entities: archetype.entities.len(),
                components: archetype
                    .columns
                    .iter()
                    .map(|column| column.descriptor.name)
                    .collect(),
            })
            .collect()
    }
}
