use rust_ecs_3d::ecs::{Bundle, EcsError, Entity, World};
use rust_ecs_3d::thread_pool::{TaskError, ThreadPool};
use std::sync::{
    atomic::{AtomicUsize, Ordering},
    Arc,
};

#[derive(Debug, PartialEq)]
struct Position(f32);
#[derive(Debug, PartialEq)]
struct Velocity(f32);
#[derive(Debug, PartialEq)]
struct Health(u32);

#[test]
fn spawn_get_and_query_only_matching_archetypes() {
    let mut world = World::new();
    let a = world.spawn2(Position(1.0), Velocity(2.0)).unwrap();
    let b = world.spawn2(Position(4.0), Health(10)).unwrap();
    let c = world
        .spawn(
            Bundle::new()
                .with(Position(7.0))
                .unwrap()
                .with(Velocity(3.0))
                .unwrap()
                .with(Health(8))
                .unwrap(),
        )
        .unwrap();
    assert_eq!(world.get::<Position>(a), Some(&Position(1.0)));
    assert!(world.get::<Velocity>(b).is_none());
    let mut visited = Vec::new();
    assert_eq!(
        world
            .for_each2::<Position, Velocity>(|e, p, v| visited.push((e, p.0 + v.0)))
            .unwrap(),
        2
    );
    assert!(visited.contains(&(a, 3.0)));
    assert!(visited.contains(&(c, 10.0)));
    assert_eq!(world.entity_count(), 3);
    assert_eq!(world.entities_with::<Health>().len(), 2);
}

#[test]
fn bundle_order_does_not_create_another_archetype() {
    let mut world = World::new();
    world.spawn2(Position(1.0), Velocity(2.0)).unwrap();
    world.spawn2(Velocity(3.0), Position(4.0)).unwrap();
    assert_eq!(world.archetype_count(), 1);
    assert_eq!(world.archetype_stats()[0].entities, 2);
}

#[test]
fn component_migration_preserves_handles_and_repairs_swapped_rows() {
    let mut world = World::new();
    let a = world.spawn2(Position(1.0), Velocity(10.0)).unwrap();
    let b = world.spawn2(Position(2.0), Velocity(20.0)).unwrap();
    let c = world.spawn2(Position(3.0), Velocity(30.0)).unwrap();
    world.insert(a, Health(42)).unwrap();
    assert_eq!(world.get::<Position>(c), Some(&Position(3.0)));
    assert_eq!(world.get::<Velocity>(a), Some(&Velocity(10.0)));
    assert_eq!(world.remove::<Health>(a).unwrap(), Health(42));
    assert!(world.get::<Health>(a).is_none());
    *world.get_mut::<Position>(b).unwrap() = Position(22.0);
    assert_eq!(world.get::<Position>(b), Some(&Position(22.0)));
    assert_eq!(world.get::<Position>(a), Some(&Position(1.0)));
    assert_eq!(world.get::<Velocity>(c), Some(&Velocity(30.0)));
    assert_eq!(world.len(), 3);
}

#[test]
fn replace_component_keeps_archetype_and_other_components() {
    let mut world = World::new();
    let e = world.spawn2(Position(1.0), Velocity(2.0)).unwrap();
    world.insert(e, Position(9.0)).unwrap();
    assert_eq!(world.get::<Position>(e), Some(&Position(9.0)));
    assert_eq!(world.get::<Velocity>(e), Some(&Velocity(2.0)));
    assert_eq!(world.archetype_count(), 1);
}

#[test]
fn despawn_repairs_last_row_and_reuse_invalidates_old_handle() {
    let mut world = World::new();
    let a = world.spawn2(Position(1.0), Velocity(2.0)).unwrap();
    let b = world.spawn2(Position(3.0), Velocity(4.0)).unwrap();
    world.despawn(a).unwrap();
    assert_eq!(world.get::<Position>(b), Some(&Position(3.0)));
    let reused = world.spawn2(Position(5.0), Velocity(6.0)).unwrap();
    assert_eq!(a.index, reused.index);
    assert_ne!(a.generation, reused.generation);
    assert!(!world.is_alive(a));
    assert!(world.get::<Position>(a).is_none());
    assert!(matches!(
        world.insert(a, Position(99.0)),
        Err(EcsError::StaleEntity(_))
    ));
    assert!(matches!(
        world.remove::<Position>(a),
        Err(EcsError::StaleEntity(_))
    ));
    assert!(matches!(world.despawn(a), Err(EcsError::StaleEntity(_))));
    assert_eq!(world.get::<Position>(reused), Some(&Position(5.0)));
}

#[test]
fn missing_component_and_fabricated_handle_do_not_change_world() {
    let mut world = World::new();
    let e = world
        .spawn(Bundle::new().with(Position(2.0)).unwrap())
        .unwrap();
    assert!(matches!(
        world.remove::<Velocity>(e),
        Err(EcsError::MissingComponent(_))
    ));
    assert!(world
        .get::<Position>(Entity {
            index: u32::MAX,
            generation: 0
        })
        .is_none());
    assert_eq!(world.entity_count(), 1);
    assert_eq!(world.get::<Position>(e), Some(&Position(2.0)));
}

#[test]
fn mutable_query_handles_both_column_orders_and_updates_once() {
    let mut world = World::new();
    for i in 0..100 {
        world.spawn2(Position(i as f32), Velocity(2.0)).unwrap();
    }
    assert_eq!(
        world
            .for_each2_mut::<Position, Velocity>(|_, p, v| p.0 += v.0)
            .unwrap(),
        100
    );
    assert_eq!(
        world
            .for_each2_mut::<Velocity, Position>(|_, v, p| {
                p.0 += v.0;
                v.0 = 3.0;
            })
            .unwrap(),
        100
    );
    let mut sum = 0.0;
    world
        .for_each2::<Position, Velocity>(|_, p, v| {
            sum += p.0;
            assert_eq!(v.0, 3.0);
        })
        .unwrap();
    assert_eq!(sum, 5350.0);
}

#[test]
fn duplicate_component_and_query_types_are_rejected() {
    assert!(matches!(
        Bundle::new()
            .with(Position(1.0))
            .unwrap()
            .with(Position(2.0)),
        Err(EcsError::DuplicateComponent(_))
    ));
    let mut world = World::new();
    assert!(world.spawn2(Position(1.0), Position(2.0)).is_err());
    assert!(world.is_empty());
    assert!(matches!(
        world.for_each2_mut::<Position, Position>(|_, _, _| panic!("Nie wolno wykonać")),
        Err(EcsError::DuplicateQueryType(_))
    ));
    assert!(matches!(
        world.for_each2::<Position, Position>(|_, _, _| panic!("Nie wolno wykonać")),
        Err(EcsError::DuplicateQueryType(_))
    ));
}

struct DropCounter(Arc<AtomicUsize>);
impl Drop for DropCounter {
    fn drop(&mut self) {
        self.0.fetch_add(1, Ordering::SeqCst);
    }
}

#[test]
fn components_drop_exactly_once_through_migration_replace_remove_and_world_drop() {
    let counter = Arc::new(AtomicUsize::new(0));
    {
        let mut world = World::new();
        let e = world
            .spawn2(Position(1.0), DropCounter(Arc::clone(&counter)))
            .unwrap();
        world.insert(e, Velocity(2.0)).unwrap();
        world.remove::<Velocity>(e).unwrap();
        assert_eq!(counter.load(Ordering::SeqCst), 0);
        world.insert(e, DropCounter(Arc::clone(&counter))).unwrap();
        assert_eq!(counter.load(Ordering::SeqCst), 1);
        let removed = world.remove::<DropCounter>(e).unwrap();
        assert_eq!(counter.load(Ordering::SeqCst), 1);
        drop(removed);
        assert_eq!(counter.load(Ordering::SeqCst), 2);
        world.insert(e, DropCounter(Arc::clone(&counter))).unwrap();
        world.despawn(e).unwrap();
        assert_eq!(counter.load(Ordering::SeqCst), 3);
        world
            .spawn(
                Bundle::new()
                    .with(DropCounter(Arc::clone(&counter)))
                    .unwrap(),
            )
            .unwrap();
    }
    assert_eq!(counter.load(Ordering::SeqCst), 4);
}

#[test]
fn empty_bundle_and_zero_sized_component_can_migrate() {
    struct Marker;
    let mut world = World::new();
    let e = world.spawn(Bundle::new()).unwrap();
    assert!(world.is_alive(e));
    world.insert(e, Marker).unwrap();
    assert_eq!(world.entities_with::<Marker>(), vec![e]);
    world.remove::<Marker>(e).unwrap();
    world.despawn(e).unwrap();
    assert!(world.is_empty());
}

#[test]
fn repeated_migration_and_despawn_preserve_every_surviving_entity() {
    let mut world = World::new();
    let entities: Vec<_> = (0..257)
        .map(|i| {
            world
                .spawn2(Position(i as f32), Velocity(i as f32 + 1.0))
                .unwrap()
        })
        .collect();
    for (i, &e) in entities.iter().enumerate() {
        if i % 2 == 0 {
            world.insert(e, Health(i as u32)).unwrap();
        }
        if i % 3 == 0 {
            world.remove::<Velocity>(e).unwrap();
        }
        if i % 5 == 0 {
            world.despawn(e).unwrap();
        }
    }
    for (i, &e) in entities.iter().enumerate() {
        if i % 5 == 0 {
            assert!(!world.is_alive(e));
            continue;
        }
        assert_eq!(world.get::<Position>(e), Some(&Position(i as f32)));
        assert_eq!(world.get::<Velocity>(e).is_some(), i % 3 != 0);
        assert_eq!(world.get::<Health>(e).is_some(), i % 2 == 0);
    }
    assert_eq!(
        world
            .archetype_stats()
            .iter()
            .map(|a| a.entities)
            .sum::<usize>(),
        world.len()
    );
}

#[test]
fn pool_returns_results_and_preserves_map_order() {
    let pool = ThreadPool::new(3);
    assert_eq!(pool.worker_count(), 3);
    assert_eq!(pool.execute(|| 21 * 2).join().unwrap(), 42);
    assert_eq!(
        pool.map_owned(vec![5, 1, 7, 2], |x| x * x).unwrap(),
        vec![25, 1, 49, 4]
    );
}

#[test]
fn task_panic_is_reported_and_worker_continues() {
    let pool = ThreadPool::new(1);
    assert_eq!(
        pool.execute(|| -> i32 { panic!("celowy test") }).join(),
        Err(TaskError::Panicked("celowy test".to_owned()))
    );
    assert_eq!(pool.execute(|| 7).join().unwrap(), 7);
}

#[test]
fn pool_drop_drains_all_accepted_tasks_even_without_result_handles() {
    let counter = Arc::new(AtomicUsize::new(0));
    {
        let pool = ThreadPool::new(4);
        for _ in 0..100 {
            let counter = Arc::clone(&counter);
            drop(pool.execute(move || {
                counter.fetch_add(1, Ordering::SeqCst);
            }));
        }
    }
    assert_eq!(counter.load(Ordering::SeqCst), 100);
}

#[test]
fn stopped_pool_reports_error_and_shutdown_is_idempotent() {
    let mut pool = ThreadPool::new(1);
    let task = pool.execute(|| 10);
    pool.shutdown();
    assert_eq!(task.join().unwrap(), 10);
    assert_eq!(pool.execute(|| 11).join(), Err(TaskError::PoolStopped));
    pool.shutdown();
}

#[test]
#[should_panic(expected = "Pula wymaga co najmniej jednego wątku")]
fn pool_rejects_zero_workers() {
    let _ = ThreadPool::new(0);
}
