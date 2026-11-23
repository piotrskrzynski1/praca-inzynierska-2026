//! Powtarzalny test symulacji bez GPU i bez okna.
use glam::Vec2;
use rust_ecs_3d::game::{Game, Input, FIXED_DT};
use std::time::Instant;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let mut steps = 1800_usize;
    let mut enemies = 0_usize;
    let mut workers = 2_usize;
    let mut args = std::env::args().skip(1);
    while let Some(arg) = args.next() {
        let value = args.next().ok_or("oczekiwano wartości argumentu")?;
        match arg.as_str() {
            "--steps" => steps = value.parse()?,
            "--enemies" => enemies = value.parse()?,
            "--workers" => workers = value.parse()?,
            _ => return Err(format!("nieznany argument: {arg}").into()),
        }
    }
    let mut game = Game::new(workers);
    game.add_enemies(enemies);
    let mut steps_advanced = 0;
    let mut peak_entities = game.world.entity_count();
    let mut peak_enemies = game.enemies();
    let mut peak_parallel_batches = 0;
    let start = Instant::now();
    for step in 0..steps {
        let angle = step as f32 * FIXED_DT * 0.4;
        let time_before = game.time;
        game.step(
            FIXED_DT,
            Input {
                movement: Vec2::new(angle.cos(), angle.sin()),
            },
        );
        steps_advanced += usize::from(game.time > time_before);
        peak_entities = peak_entities.max(game.world.entity_count());
        peak_enemies = peak_enemies.max(game.enemies());
        peak_parallel_batches = peak_parallel_batches.max(game.parallel_batches);
    }
    println!("{{\"steps_requested\":{steps},\"steps_advanced\":{steps_advanced},\"simulation_seconds\":{:.6},\"wall_seconds\":{:.6},\"entities\":{},\"peak_entities\":{peak_entities},\"enemies\":{},\"peak_enemies\":{peak_enemies},\"archetypes\":{},\"score\":{},\"health\":{:.3},\"game_over\":{},\"workers\":{},\"parallel_batches_last_step\":{},\"peak_parallel_batches\":{peak_parallel_batches},\"level\":{},\"xp\":{},\"projectiles_per_volley\":{},\"wave_size\":{},\"wave_interval\":{:.3}}}",
        game.time, start.elapsed().as_secs_f64(), game.world.entity_count(), game.enemies(),
        game.world.archetype_count(), game.score, game.health(), game.is_over(), game.workers, game.parallel_batches,
        game.level, game.xp, game.projectile_count(), game.wave_size(), game.wave_interval());
    Ok(())
}
