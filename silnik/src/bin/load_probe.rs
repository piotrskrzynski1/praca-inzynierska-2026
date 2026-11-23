//! Pomiar czasu pełnego kroku symulacji gry bez okna i renderowania.
//! Dane CSV trafiają na stdout, opis warunków pomiaru na stderr.
use glam::Vec2;
use rust_ecs_3d::game::{Game, Input, Player, FIXED_DT};
use std::io::{self, BufWriter, Write};
use std::time::Instant;

const WARMUP: usize = 60;
const SAMPLES: usize = 300;
const INITIAL_LEVEL: u32 = 13;

struct Sample {
    step: usize,
    simulation_seconds: f32,
    enemies_before: usize,
    enemies_after: usize,
    entities_before: usize,
    entities_after: usize,
    score: u32,
    level: u32,
    health_after: f32,
    step_time_ns: u128,
}

fn input_for_step(step: usize) -> Input {
    // Ten sam powtarzalny ruch, który wykorzystuje program headless.
    let angle = step as f32 * FIXED_DT * 0.4;
    Input {
        movement: Vec2::new(angle.cos(), angle.sin()),
    }
}

fn restore_health(game: &mut Game) {
    // Wyłącznie warunek diagnostyczny: śmierć gracza nie może zatrzymać
    // kolejnych próbek. Naliczanie obrażeń wewnątrz Game::step pozostaje aktywne.
    game.world.get_mut::<Player>(game.player).unwrap().health = 100.0;
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    if cfg!(debug_assertions) {
        eprintln!("UWAGA: profil debug; pomiar wykonaj przez cargo run --release --no-default-features --bin load_probe");
    }
    eprintln!("probe=full_game_step_cpu");
    eprintln!("package_version={}", env!("CARGO_PKG_VERSION"));
    eprintln!(
        "os={},arch={},logical_cpus={}",
        std::env::consts::OS,
        std::env::consts::ARCH,
        std::thread::available_parallelism().map_or(1, |n| n.get())
    );
    eprintln!(
        "profile={},warmup_steps={WARMUP},measured_steps={SAMPLES},dt={FIXED_DT},initial_level={INITIAL_LEVEL}",
        if cfg!(debug_assertions) { "debug" } else { "release" }
    );
    eprintln!("initial_enemies=100,1000,5000; workers=1,4; seed=Game::new_default; movement=headless_circular");
    eprintln!("controls_invulnerable=true; health_reset_to_100_before_each_step=true; contact_damage_active=true; spawning_and_kills_active=true");
    eprintln!("health_reset_input_counts_and_csv_excluded=true; measured=Game::step_wall_clock_nanoseconds; rendering_and_gpu_excluded=true");
    eprintln!("limitations=cpu_simulation_only; no_control_implementation; not_a_measurement_of_full_frame_time_or_ecs_advantage");

    let mut output = BufWriter::new(io::stdout().lock());
    writeln!(output, "initial_enemies,workers,controls_invulnerable,sample,step,simulation_seconds,enemies_before,enemies_after,entities_before,entities_after,score,level,health_after,step_time_ns")?;

    for initial_enemies in [100_usize, 1_000, 5_000] {
        for workers in [1, 4] {
            let mut game = Game::new(workers);
            game.add_enemies(initial_enemies - game.enemies());
            game.level = INITIAL_LEVEL;
            assert_eq!(
                game.enemies(),
                initial_enemies,
                "limit przeciwników nie pozwala utworzyć próbki"
            );
            assert_eq!(
                game.projectile_count(),
                5,
                "poziom 13 powinien wystrzeliwać pięć pocisków w salwie"
            );

            for step in 0..WARMUP {
                restore_health(&mut game);
                game.step(FIXED_DT, input_for_step(step));
            }

            let mut samples = Vec::with_capacity(SAMPLES);
            for sample in 0..SAMPLES {
                let step = WARMUP + sample;
                let input = input_for_step(step);
                restore_health(&mut game);
                let enemies_before = game.enemies();
                let entities_before = game.world.entity_count();
                let time_before = game.time;

                let start = Instant::now();
                game.step(FIXED_DT, input);
                let step_time_ns = start.elapsed().as_nanos();

                assert!(
                    game.time > time_before,
                    "symulacja zatrzymała się podczas pomiaru"
                );
                samples.push(Sample {
                    step,
                    simulation_seconds: game.time,
                    enemies_before,
                    enemies_after: game.enemies(),
                    entities_before,
                    entities_after: game.world.entity_count(),
                    score: game.score,
                    level: game.level,
                    health_after: game.health(),
                    step_time_ns,
                });
            }

            // Zapis odbywa się po pomiarach danego scenariusza.
            for (sample, row) in samples.iter().enumerate() {
                writeln!(
                    output,
                    "{initial_enemies},{workers},true,{sample},{},{:.6},{},{},{},{},{},{},{:.3},{}",
                    row.step,
                    row.simulation_seconds,
                    row.enemies_before,
                    row.enemies_after,
                    row.entities_before,
                    row.entities_after,
                    row.score,
                    row.level,
                    row.health_after,
                    row.step_time_ns
                )?;
            }
        }
    }
    output.flush()?;
    Ok(())
}
