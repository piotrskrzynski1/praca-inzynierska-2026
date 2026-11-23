//! Pomiar czasu iteracji: archetypowe SoA i kontrolna tablica struktur AoS.
//! Dane CSV trafiają na stdout, metadane na stderr. Bez dodatkowych bibliotek.

use rust_ecs_3d::ecs::World;
use std::hint::black_box;
use std::time::Instant;

#[derive(Clone, Copy)]
struct Position([f32; 3]);
#[derive(Clone, Copy)]
struct Velocity([f32; 3]);
struct Body {
    position: Position,
    velocity: Velocity,
}

const WARMUP: usize = 100;
const SAMPLES: usize = 15;
const ITERATIONS: usize = 100;
const DT: f32 = 1.0 / 60.0;

fn initial(i: usize) -> (Position, Velocity) {
    (
        Position([i as f32 * 0.001, (i % 97) as f32, (i % 31) as f32]),
        Velocity([0.75, -0.25, 0.5]),
    )
}
fn ecs_step(world: &mut World) {
    world
        .for_each2_values_mut::<Position, Velocity>(|position, velocity| {
            for axis in 0..3 {
                position.0[axis] += velocity.0[axis] * DT;
            }
        })
        .unwrap();
}
fn aos_step(bodies: &mut [Body]) {
    for body in bodies {
        for axis in 0..3 {
            body.position.0[axis] += body.velocity.0[axis] * DT;
        }
    }
}
fn ecs_checksum(world: &World) -> f64 {
    let mut checksum = 0.0;
    world
        .for_each2::<Position, Velocity>(|_, p, _| {
            checksum += p.0.iter().map(|&x| x as f64).sum::<f64>();
        })
        .unwrap();
    checksum
}
fn aos_checksum(bodies: &[Body]) -> f64 {
    bodies
        .iter()
        .map(|body| body.position.0.iter().map(|&x| x as f64).sum::<f64>())
        .sum()
}

fn main() {
    if cfg!(debug_assertions) {
        eprintln!(
            "UWAGA: profil debug; miarodajne pomiary wymagają cargo run --release --bin benchmark"
        );
    }
    eprintln!("benchmark=position_velocity_integration");
    eprintln!("package_version={}", env!("CARGO_PKG_VERSION"));
    eprintln!(
        "os={},arch={},logical_cpus={}",
        std::env::consts::OS,
        std::env::consts::ARCH,
        std::thread::available_parallelism().map_or(1, |n| n.get())
    );
    eprintln!(
        "profile={},warmup_steps={WARMUP},samples={SAMPLES},steps_per_sample={ITERATIONS},dt={DT}",
        if cfg!(debug_assertions) {
            "debug"
        } else {
            "release"
        }
    );
    eprintln!("allocation_and_checksum_excluded=true; execution=single_thread; order=alternating; numbers=wall_clock_nanoseconds");
    println!("implementation,entities,sample,iterations,total_ns,ns_per_iteration,ns_per_entity,checksum");
    for count in [1_000, 10_000, 100_000] {
        let mut world = World::new();
        let mut bodies = Vec::with_capacity(count);
        for i in 0..count {
            let (position, velocity) = initial(i);
            world.spawn2(position, velocity).unwrap();
            bodies.push(Body { position, velocity });
        }
        for _ in 0..WARMUP {
            ecs_step(black_box(&mut world));
            aos_step(black_box(&mut bodies));
        }
        for sample in 0..SAMPLES {
            // Kolejność jest naprzemienna, aby zmniejszyć wpływ rozgrzewania procesora.
            for implementation in if sample % 2 == 0 {
                ["ecs_soa", "vec_aos"]
            } else {
                ["vec_aos", "ecs_soa"]
            } {
                let start = Instant::now();
                if implementation == "ecs_soa" {
                    for _ in 0..ITERATIONS {
                        ecs_step(black_box(&mut world));
                    }
                } else {
                    for _ in 0..ITERATIONS {
                        aos_step(black_box(&mut bodies));
                    }
                }
                let elapsed = start.elapsed().as_nanos();
                let checksum = black_box(if implementation == "ecs_soa" {
                    ecs_checksum(&world)
                } else {
                    aos_checksum(&bodies)
                });
                let ns_per_iteration = elapsed as f64 / ITERATIONS as f64;
                println!("{implementation},{count},{sample},{ITERATIONS},{elapsed},{ns_per_iteration:.3},{:.6},{checksum:.6}", ns_per_iteration / count as f64);
            }
            let ecs_sum = ecs_checksum(&world);
            let aos_sum = aos_checksum(&bodies);
            let tolerance = 1e-6 * aos_sum.abs().max(1.0);
            assert!(
                (ecs_sum - aos_sum).abs() <= tolerance,
                "Niezgodne wyniki wariantów pomiarowych: ecs={ecs_sum}, aos={aos_sum}"
            );
        }
    }
}
