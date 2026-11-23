//! Deterministyczna symulacja niezależna od okna i urządzenia graficznego.
use crate::ecs::{Bundle, Entity, World};
use crate::thread_pool::ThreadPool;
use glam::{Vec2, Vec3};

pub const FIXED_DT: f32 = 1.0 / 60.0;
pub const ARENA_HALF_SIZE: f32 = 20.0;
pub const MAX_ENEMIES: usize = 10_000;
pub const LEVELS_PER_VOLLEY_UPGRADE: u32 = 3;

#[derive(Clone, Copy, Debug)]
pub struct Position(pub Vec3);
#[derive(Clone, Copy, Debug)]
pub struct Velocity(pub Vec3);
#[derive(Clone, Copy, Debug)]
pub struct Renderable {
    pub color: [f32; 4],
    pub scale: Vec3,
}
#[derive(Clone, Copy, Debug)]
pub struct Player {
    pub health: f32,
}
#[derive(Clone, Copy, Debug)]
pub struct Enemy {
    pub health: f32,
}
#[derive(Clone, Copy, Debug)]
pub struct Projectile {
    pub life: f32,
}
#[derive(Clone, Copy, Debug)]
pub struct Pickup {
    pub xp: u32,
    pub life: f32,
}

#[derive(Clone, Copy, Debug, Default)]
pub struct Input {
    /// Kierunek w płaszczyźnie XZ; diagonalne wejście jest normalizowane.
    pub movement: Vec2,
}

#[derive(Clone, Copy, Debug)]
pub struct RenderItem {
    pub position: Vec3,
    pub scale: Vec3,
    pub color: [f32; 4],
}

pub struct Game {
    pub world: World,
    pub player: Entity,
    pub time: f32,
    pub score: u32,
    pub xp: u32,
    pub level: u32,
    pub paused: bool,
    pub parallel_batches: usize,
    pub workers: usize,
    pool: ThreadPool,
    spawn_timer: f32,
    fire_timer: f32,
    rng: u64,
    enemies_buf: Vec<(Entity, Vec3)>,
    current_enemies_buf: Vec<(Entity, Vec3, f32)>,
    despawn_buf: Vec<Entity>,
    damaged_enemies_buf: Vec<(Entity, f32)>,
    xp_drops_buf: Vec<Vec3>,
}

impl Game {
    pub fn new(workers: usize) -> Self {
        let workers = workers.max(1);
        let mut world = World::new();
        let player = world
            .spawn(
                Bundle::new()
                    .with(Position(Vec3::new(0.0, 0.7, 0.0)))
                    .unwrap()
                    .with(Velocity(Vec3::ZERO))
                    .unwrap()
                    .with(Renderable {
                        color: [0.05, 0.65, 0.80, 1.0],
                        scale: Vec3::new(0.8, 1.4, 0.8),
                    })
                    .unwrap()
                    .with(Player { health: 100.0 })
                    .unwrap(),
            )
            .expect("unikalne typy komponentów gracza");
        let mut game = Self {
            world,
            player,
            time: 0.0,
            score: 0,
            xp: 0,
            level: 1,
            paused: false,
            parallel_batches: 0,
            workers,
            pool: ThreadPool::new(workers),
            spawn_timer: 0.0,
            fire_timer: 0.0,
            rng: 0x1234_5678_90ab_cdef,
            enemies_buf: Vec::new(),
            current_enemies_buf: Vec::new(),
            despawn_buf: Vec::new(),
            damaged_enemies_buf: Vec::new(),
            xp_drops_buf: Vec::new(),
        };
        game.add_enemies(12);
        game
    }

    /// Restart zachowuje konfigurację puli wątków.
    pub fn restart(&mut self) {
        *self = Self::new(self.workers);
    }

    pub fn health(&self) -> f32 {
        self.world
            .get::<Player>(self.player)
            .map_or(0.0, |p| p.health)
    }

    pub fn is_over(&self) -> bool {
        self.health() <= 0.0
    }

    pub fn player_position(&self) -> Vec3 {
        self.world
            .get::<Position>(self.player)
            .map_or(Vec3::ZERO, |p| p.0)
    }

    pub fn enemies(&self) -> usize {
        self.world.count_with::<Enemy>()
    }

    pub fn xp_to_next_level(&self) -> u32 {
        5 * self.level
    }

    pub fn fire_interval(&self) -> f32 {
        (0.30 * 0.88_f32.powi((self.level - 1) as i32)).max(0.09)
    }

    /// Co trzy poziomy broń zyskuje pocisk, aż do pięciu w salwie.
    pub fn projectile_count(&self) -> usize {
        1 + (self.level.saturating_sub(1) / LEVELS_PER_VOLLEY_UPGRADE).min(4) as usize
    }

    pub fn next_volley_upgrade_level(&self) -> Option<u32> {
        let count = self.projectile_count();
        (count < 5).then_some(1 + count as u32 * LEVELS_PER_VOLLEY_UPGRADE)
    }

    /// Fala rośnie co 15 sekund; limit chroni przed zbyt dużym pojedynczym skokiem.
    pub fn wave_size(&self) -> usize {
        let stage = (self.time / 15.0).floor().clamp(0.0, 25.0) as usize;
        (3 + 4 * stage).min(100)
    }

    pub fn wave_interval(&self) -> f32 {
        (1.2 - 0.008 * self.time).max(0.30)
    }

    fn fire_volley(&mut self, position: Vec3, target: Vec3) {
        let mut aim = chase_velocity(position, target, 1.0);
        if aim == Vec3::ZERO {
            aim = Vec3::X;
        }
        let count = self.projectile_count();
        let angle_step = 10.0_f32.to_radians();
        for index in 0..count {
            // Salwa jest symetryczna względem kierunku do najbliższego przeciwnika.
            let angle = (index as f32 - (count - 1) as f32 * 0.5) * angle_step;
            let (sin, cos) = angle.sin_cos();
            let velocity =
                Vec3::new(aim.x * cos - aim.z * sin, 0.0, aim.x * sin + aim.z * cos) * 18.0;
            self.world
                .spawn(
                    Bundle::new()
                        .with(Position(Vec3::new(position.x, 0.65, position.z)))
                        .unwrap()
                        .with(Velocity(velocity))
                        .unwrap()
                        .with(Renderable {
                            color: [1.0, 0.72, 0.12, 1.0],
                            scale: Vec3::splat(0.25),
                        })
                        .unwrap()
                        .with(Projectile { life: 2.0 })
                        .unwrap(),
                )
                .expect("unikalne typy komponentów pocisku");
        }
    }

    #[cfg(test)]
    fn drop_xp(&mut self, position: Vec3) {
        spawn_xp(&mut self.world, position);
    }

    fn random(&mut self) -> f32 {
        self.rng = self.rng.wrapping_mul(6364136223846793005).wrapping_add(1);
        ((self.rng >> 32) as u32) as f32 / u32::MAX as f32
    }

    pub fn add_enemies(&mut self, count: usize) {
        let remaining = MAX_ENEMIES.saturating_sub(self.enemies());
        for _ in 0..count.min(remaining) {
            let angle = self.random() * std::f32::consts::TAU;
            let radius = 16.0 + self.random() * 3.0;
            let position = Vec3::new(angle.cos() * radius, 0.55, angle.sin() * radius);
            self.world
                .spawn(
                    Bundle::new()
                        .with(Position(position))
                        .unwrap()
                        .with(Velocity(Vec3::ZERO))
                        .unwrap()
                        .with(Renderable {
                            color: [0.74, 0.12, 0.24, 1.0],
                            scale: Vec3::new(0.75, 1.1, 0.75),
                        })
                        .unwrap()
                        .with(Enemy { health: 1.0 })
                        .unwrap(),
                )
                .expect("unikalne typy komponentów przeciwnika");
        }
    }

    /// Jeden krok symulacji. Aplikacja wywołuje go z FIXED_DT.
    /// Ograniczenie dt chroni także bezpośrednich użytkowników API.
    pub fn step(&mut self, dt: f32, input: Input) {
        if self.paused || self.is_over() || !dt.is_finite() || dt <= 0.0 {
            return;
        }
        let dt = dt.min(0.1);
        self.time += dt;
        let movement = if input.movement.is_finite() {
            input.movement.clamp_length_max(1.0)
        } else {
            Vec2::ZERO
        };
        self.world.get_mut::<Velocity>(self.player).unwrap().0 =
            Vec3::new(movement.x, 0.0, movement.y) * 6.0;
        self.spawn_timer -= dt;
        if self.spawn_timer <= 0.0 {
            self.add_enemies(self.wave_size());
            self.spawn_timer = self.wave_interval();
        }

        let player_position = self.player_position();
        let speed = (1.5 + self.time * 0.006).min(3.0);
        self.enemies_buf.clear();
        {
            let enemies = &mut self.enemies_buf;
            self.world
                .for_each2::<Enemy, Position>(|entity, _, p| enemies.push((entity, p.0)))
                .expect("Enemy i Position są różnymi typami");
        }

        // Każde zadanie otrzymuje własny fragment danych. World nigdy nie jest
        // udostępniany pracownikom; zapis następuje sekwencyjnie po join.
        if self.enemies_buf.len() >= 128 && self.workers > 1 {
            let chunk_size = self.enemies_buf.len().div_ceil(self.workers);
            let batches: Vec<Vec<_>> = self
                .enemies_buf
                .chunks(chunk_size)
                .map(|c| c.to_vec())
                .collect();
            self.parallel_batches = batches.len();
            let results = self
                .pool
                .map_owned(batches, move |batch| {
                    batch
                        .into_iter()
                        .map(|(e, p)| (e, chase_velocity(p, player_position, speed)))
                        .collect::<Vec<_>>()
                })
                .expect("zadania sterowania przeciwnikami nie panikują");
            let mut iter = results.iter().flat_map(|b| b.iter().copied()).peekable();
            let mut mismatch = false;
            self.world
                .for_each2_mut::<Enemy, Velocity>(|entity, _, v| {
                    if let Some(&(e, velocity)) = iter.peek() {
                        if e == entity {
                            v.0 = velocity;
                            iter.next();
                            return;
                        }
                    }
                    mismatch = true;
                })
                .expect("Enemy i Velocity są różnymi typami");
            if mismatch || iter.peek().is_some() {
                for (entity, velocity) in results.into_iter().flatten() {
                    if let Some(v) = self.world.get_mut::<Velocity>(entity) {
                        v.0 = velocity;
                    }
                }
            }
        } else {
            self.parallel_batches = 0;
            let enemies = &self.enemies_buf;
            let mut idx = 0;
            let mut mismatch = false;
            self.world
                .for_each2_mut::<Enemy, Velocity>(|entity, _, v| {
                    if let Some(&(e, pos)) = enemies.get(idx) {
                        if e == entity {
                            v.0 = chase_velocity(pos, player_position, speed);
                            idx += 1;
                            return;
                        }
                    }
                    mismatch = true;
                })
                .expect("Enemy i Velocity są różnymi typami");
            if mismatch || idx != enemies.len() {
                for &(entity, pos) in &self.enemies_buf {
                    if let Some(v) = self.world.get_mut::<Velocity>(entity) {
                        v.0 = chase_velocity(pos, player_position, speed);
                    }
                }
            }
        }

        self.world
            .for_each2_values_mut::<Position, Velocity>(|p, v| p.0 += v.0 * dt)
            .expect("Position i Velocity są różnymi typami");
        let p = self.world.get_mut::<Position>(self.player).unwrap();
        p.0.x = p.0.x.clamp(-ARENA_HALF_SIZE + 1.0, ARENA_HALF_SIZE - 1.0);
        p.0.z = p.0.z.clamp(-ARENA_HALF_SIZE + 1.0, ARENA_HALF_SIZE - 1.0);

        self.fire_timer -= dt;
        if self.fire_timer <= 0.0 {
            let player = self.player_position();
            let target = self
                .enemies_buf
                .iter()
                .min_by(|a, b| {
                    a.1.distance_squared(player)
                        .total_cmp(&b.1.distance_squared(player))
                })
                .map(|&(_, pos)| pos);
            if let Some(target) = target {
                self.fire_volley(player, target);
                self.fire_timer = self.fire_interval();
            }
        }

        self.current_enemies_buf.clear();
        {
            let current_enemies = &mut self.current_enemies_buf;
            self.world
                .for_each2::<Enemy, Position>(|e, enemy, p| {
                    current_enemies.push((e, p.0, enemy.health));
                })
                .expect("Enemy i Position są różnymi typami");
        }

        self.despawn_buf.clear();
        self.damaged_enemies_buf.clear();
        self.xp_drops_buf.clear();
        let hit_radius_sq = 0.55_f32.powi(2);
        {
            let current_enemies = &mut self.current_enemies_buf;
            let despawn = &mut self.despawn_buf;
            let damaged = &mut self.damaged_enemies_buf;
            let xp_drops = &mut self.xp_drops_buf;
            let score = &mut self.score;
            self.world
                .for_each2_mut::<Position, Projectile>(|bullet, pos, life| {
                    life.life -= dt;
                    let expired = life.life <= 0.0;
                    let mut hit = false;
                    for (enemy, enemy_pos, hp) in current_enemies.iter_mut() {
                        if *hp > 0.0 && distance_xz_squared(pos.0, *enemy_pos) < hit_radius_sq {
                            *hp -= 1.0;
                            if *hp <= 0.0 {
                                despawn.push(*enemy);
                                xp_drops.push(*enemy_pos);
                                *score += 1;
                            } else {
                                damaged.push((*enemy, *hp));
                            }
                            hit = true;
                            break;
                        }
                    }
                    if expired || hit {
                        despawn.push(bullet);
                    }
                })
                .expect("Position i Projectile są różnymi typami");
        }
        for &(enemy, hp) in &self.damaged_enemies_buf {
            if let Some(e) = self.world.get_mut::<Enemy>(enemy) {
                e.health = hp;
            }
        }
        for &entity in &self.despawn_buf {
            self.world.despawn(entity).unwrap();
        }
        for &pos in &self.xp_drops_buf {
            spawn_xp(&mut self.world, pos);
        }

        let player = self.player_position();
        let pickup_radius_sq = 1.6_f32.powi(2);
        self.despawn_buf.clear();
        {
            let despawn = &mut self.despawn_buf;
            let xp = &mut self.xp;
            self.world
                .for_each2_mut::<Position, Pickup>(|pickup, position, value| {
                    value.life -= dt;
                    let expired = value.life <= 0.0;
                    let collected = distance_xz_squared(player, position.0) < pickup_radius_sq;
                    if collected {
                        *xp += value.xp;
                    }
                    if expired || collected {
                        despawn.push(pickup);
                    }
                })
                .expect("Position i Pickup są różnymi typami");
        }
        for &pickup in &self.despawn_buf {
            self.world.despawn(pickup).unwrap();
        }

        while self.xp >= self.xp_to_next_level() {
            self.xp -= self.xp_to_next_level();
            self.level += 1;
        }
        let contact_radius_sq = 0.9_f32.powi(2);
        let contacts = self
            .current_enemies_buf
            .iter()
            .filter(|&&(_, p, hp)| hp > 0.0 && distance_xz_squared(player, p) < contact_radius_sq)
            .count();
        let health = (self.health() - contacts as f32 * 18.0 * dt).max(0.0);
        self.world.get_mut::<Player>(self.player).unwrap().health = health;
    }

    pub fn for_each_render_item(&self, mut f: impl FnMut(RenderItem)) {
        self.world
            .for_each2::<Position, Renderable>(|_, p, r| {
                f(RenderItem {
                    position: p.0,
                    scale: r.scale,
                    color: r.color,
                });
            })
            .expect("Position i Renderable są różnymi typami");
    }

    pub fn render_items(&self) -> Vec<RenderItem> {
        let mut items = Vec::with_capacity(self.world.entity_count() + 5);
        self.for_each_render_item(|item| items.push(item));
        items
    }
}

fn spawn_xp(world: &mut World, position: Vec3) {
    world
        .spawn(
            Bundle::new()
                .with(Position(Vec3::new(position.x, 0.18, position.z)))
                .unwrap()
                .with(Renderable {
                    color: [0.20, 0.85, 0.42, 1.0],
                    scale: Vec3::splat(0.28),
                })
                .unwrap()
                .with(Pickup { xp: 1, life: 60.0 })
                .unwrap(),
        )
        .expect("unikalne typy komponentów doświadczenia");
}

fn chase_velocity(from: Vec3, to: Vec3, speed: f32) -> Vec3 {
    let delta = Vec3::new(to.x - from.x, 0.0, to.z - from.z);
    delta.normalize_or_zero() * speed
}

fn distance_xz_squared(a: Vec3, b: Vec3) -> f32 {
    (a.x - b.x).powi(2) + (a.z - b.z).powi(2)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn diagonal_movement_does_not_increase_speed() {
        let mut game = Game::new(1);
        game.step(
            FIXED_DT,
            Input {
                movement: Vec2::ONE,
            },
        );
        let displacement = game.player_position() - Vec3::new(0.0, 0.7, 0.0);
        assert!((displacement.length() - 6.0 * FIXED_DT).abs() < 1e-5);
    }

    #[test]
    fn pause_and_invalid_time_do_not_change_simulation() {
        let mut game = Game::new(1);
        game.step(f32::NAN, Input::default());
        game.step(-1.0, Input::default());
        game.paused = true;
        game.step(FIXED_DT, Input::default());
        assert_eq!(game.time, 0.0);
        assert_eq!(game.enemies(), 12);
    }

    #[test]
    fn restart_restores_initial_world() {
        let mut game = Game::new(2);
        game.level = 13;
        game.add_enemies(250);
        game.step(FIXED_DT, Input::default());
        assert!(game.parallel_batches > 0);
        game.restart();
        assert_eq!(game.time, 0.0);
        assert_eq!(game.score, 0);
        assert_eq!(game.level, 1);
        assert_eq!(game.xp, 0);
        assert_eq!(game.health(), 100.0);
        assert_eq!(game.world.entity_count(), 13);
        assert_eq!(game.workers, 2);
        assert_eq!(game.projectile_count(), 1);
        assert_eq!(game.next_volley_upgrade_level(), Some(4));
        assert!(game.world.entities_with::<Projectile>().is_empty());
    }

    #[test]
    fn volley_upgrades_every_three_levels_and_stops_at_five() {
        let mut game = Game::new(1);
        for (level, count, next) in [
            (1, 1, Some(4)),
            (3, 1, Some(4)),
            (4, 2, Some(7)),
            (6, 2, Some(7)),
            (7, 3, Some(10)),
            (9, 3, Some(10)),
            (10, 4, Some(13)),
            (12, 4, Some(13)),
            (13, 5, None),
            (100, 5, None),
            (u32::MAX, 5, None),
        ] {
            game.level = level;
            assert_eq!(game.projectile_count(), count, "poziom {level}");
            assert_eq!(game.next_volley_upgrade_level(), next, "poziom {level}");
        }
    }

    #[test]
    fn volleys_form_symmetric_cones_with_constant_projectile_speed() {
        let position = Vec3::new(2.0, 0.7, -3.0);
        let target = Vec3::new(6.0, 0.55, 0.0);
        let aim = chase_velocity(position, target, 1.0);
        for (level, count) in [(1, 1), (4, 2), (7, 3), (10, 4), (13, 5)] {
            let mut game = Game::new(1);
            game.level = level;
            game.fire_volley(position, target);
            let bullets = game.world.entities_with::<Projectile>();
            assert_eq!(bullets.len(), count);
            let mut angles = Vec::new();
            for bullet in bullets {
                let velocity = game.world.get::<Velocity>(bullet).unwrap().0;
                assert!((velocity.length() - 18.0).abs() < 1e-5);
                assert_eq!(velocity.y, 0.0);
                assert_eq!(
                    game.world.get::<Position>(bullet).unwrap().0,
                    Vec3::new(position.x, 0.65, position.z)
                );
                let direction = velocity / 18.0;
                let cross = aim.x * direction.z - aim.z * direction.x;
                angles.push(cross.atan2(aim.dot(direction)));
            }
            angles.sort_by(f32::total_cmp);
            for (index, angle) in angles.iter().enumerate() {
                let expected = (index as f32 - (count - 1) as f32 * 0.5) * 10.0_f32.to_radians();
                assert!((angle - expected).abs() < 1e-5, "poziom {level}");
            }
            assert!(angles.iter().sum::<f32>().abs() < 1e-5);
        }
    }

    #[test]
    fn coincident_and_near_zero_targets_produce_finite_projectiles() {
        for target in [Vec3::ZERO, Vec3::new(1e-30, 0.0, -1e-30)] {
            let mut game = Game::new(1);
            game.level = 13;
            game.fire_volley(Vec3::ZERO, target);
            for bullet in game.world.entities_with::<Projectile>() {
                let velocity = game.world.get::<Velocity>(bullet).unwrap().0;
                assert!(velocity.is_finite());
                assert!((velocity.length() - 18.0).abs() < 1e-5);
                assert!(velocity.x > 0.0);
            }
        }
    }

    #[test]
    fn automatic_fire_uses_upgraded_volley() {
        let mut game = Game::new(1);
        game.level = 13;
        game.spawn_timer = 1.0;
        game.step(FIXED_DT, Input::default());
        assert_eq!(game.world.entities_with::<Projectile>().len(), 5);
        assert!((game.fire_timer - game.fire_interval()).abs() < 1e-5);
    }

    #[test]
    fn enemy_waves_grow_and_keep_a_minimum_interval() {
        let mut game = Game::new(1);
        for (time, count, interval) in [
            (0.0, 3, 1.2),
            (14.9, 3, 1.0808),
            (15.0, 7, 1.08),
            (60.0, 19, 0.72),
            (120.0, 35, 0.30),
            (375.0, 100, 0.30),
            (3600.0, 100, 0.30),
        ] {
            game.time = time;
            assert_eq!(game.wave_size(), count, "czas {time}");
            assert!((game.wave_interval() - interval).abs() < 1e-5);
        }
    }

    #[test]
    fn simulation_spawns_the_larger_wave_after_one_minute() {
        let mut game = Game::new(1);
        game.time = 60.0;
        game.fire_timer = 1.0;
        let before = game.enemies();
        game.step(FIXED_DT, Input::default());
        assert_eq!(game.enemies(), before + 19);
        assert!((game.spawn_timer - game.wave_interval()).abs() < 1e-5);
    }

    #[test]
    fn enemy_spawn_requests_respect_the_world_limit() {
        let mut game = Game::new(1);
        game.add_enemies(usize::MAX);
        assert_eq!(game.enemies(), MAX_ENEMIES);
        assert_eq!(game.world.entity_count(), MAX_ENEMIES + 1);
        game.add_enemies(100);
        assert_eq!(game.enemies(), MAX_ENEMIES);
    }

    #[test]
    fn parallel_and_sequential_simulations_agree() {
        let mut a = Game::new(1);
        let mut b = Game::new(4);
        a.add_enemies(150);
        b.add_enemies(150);
        for _ in 0..100 {
            a.step(
                FIXED_DT,
                Input {
                    movement: Vec2::new(1.0, 0.0),
                },
            );
            b.step(
                FIXED_DT,
                Input {
                    movement: Vec2::new(1.0, 0.0),
                },
            );
        }
        assert_eq!(a.score, b.score);
        assert_eq!(a.world.entity_count(), b.world.entity_count());
        for (x, y) in a.render_items().iter().zip(b.render_items()) {
            assert_eq!(x.position, y.position);
        }
    }

    #[test]
    fn contact_damage_causes_game_over_and_freezes_simulation() {
        let mut game = Game::new(1);
        game.world.get_mut::<Player>(game.player).unwrap().health = 0.1;
        game.fire_timer = 1.0;
        for enemy in game.world.entities_with::<Enemy>().into_iter().take(3) {
            game.world.get_mut::<Position>(enemy).unwrap().0 = game.player_position();
        }
        game.step(FIXED_DT, Input::default());
        assert!(game.is_over());
        let time = game.time;
        game.step(FIXED_DT, Input::default());
        assert_eq!(game.time, time);
    }

    #[test]
    fn pickups_level_up_and_increase_fire_rate() {
        let mut game = Game::new(1);
        let initial_interval = game.fire_interval();
        for _ in 0..5 {
            game.drop_xp(game.player_position());
        }
        game.step(FIXED_DT, Input::default());
        assert_eq!(game.level, 2);
        assert_eq!(game.xp, 0);
        assert_eq!(game.world.entities_with::<Pickup>().len(), 0);
        assert!(game.fire_interval() < initial_interval);
    }

    #[test]
    fn projectile_hit_destroys_enemy_once_and_drops_xp() {
        let mut game = Game::new(1);
        let enemy = game.world.entities_with::<Enemy>()[0];
        let position = Vec3::new(5.0, 0.55, 0.0);
        game.world.get_mut::<Position>(enemy).unwrap().0 = position;
        for _ in 0..2 {
            game.world
                .spawn(
                    Bundle::new()
                        .with(Position(position))
                        .unwrap()
                        .with(Velocity(Vec3::ZERO))
                        .unwrap()
                        .with(Projectile { life: 1.0 })
                        .unwrap(),
                )
                .unwrap();
        }
        game.step(FIXED_DT, Input::default());
        assert!(game.world.get::<Enemy>(enemy).is_none());
        assert_eq!(game.score, 1);
        assert_eq!(game.world.entities_with::<Pickup>().len(), 1);
    }

    #[test]
    fn expired_projectiles_are_removed_and_player_stays_in_arena() {
        let mut game = Game::new(1);
        let bullet = game
            .world
            .spawn(
                Bundle::new()
                    .with(Position(Vec3::new(100.0, 0.0, 100.0)))
                    .unwrap()
                    .with(Projectile {
                        life: FIXED_DT * 0.5,
                    })
                    .unwrap(),
            )
            .unwrap();
        game.world.get_mut::<Position>(game.player).unwrap().0.x = ARENA_HALF_SIZE - 1.0;
        game.step(FIXED_DT, Input { movement: Vec2::X });
        assert!(game.world.get::<Projectile>(bullet).is_none());
        assert_eq!(game.player_position().x, ARENA_HALF_SIZE - 1.0);
    }
}
