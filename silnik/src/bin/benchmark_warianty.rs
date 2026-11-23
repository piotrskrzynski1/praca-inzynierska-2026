//! Rozszerzony pomiar iteracji; uzupełnia benchmark.rs, który pozostaje bez zmian.
//! Porównuje archetypowe kolumny ECS, te same kolumny bez ECS (pętla po encjach
//! i pętla po ciągłych wartościach f32) oraz kontrolną tablicę struktur AoS.
//! Dane CSV trafiają na stdout, metadane na stderr. Bez dodatkowych bibliotek.
//! Plik przygotowano z pomocą narzędzia Claude (Anthropic), zob. sekcja „Wykorzystanie AI”.
//!
//! Warianty:
//! - ecs_soa:  kolumny Position i Velocity w archetypie, `for_each2_values_mut`,
//! - soa_vec:  te same dane w dwóch `Vec<[f32; 3]>`, ta sama pętla po encjach, bez ECS,
//! - soa_flat: te same dwa wektory przetwarzane jako ciągłe tablice `f32`,
//! - vec_aos:  `Vec<Body>` z oboma komponentami w jednej strukturze.

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
const VARIANTS: [&str; 4] = ["ecs_soa", "soa_vec", "soa_flat", "vec_aos"];

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
fn soa_vec_step(positions: &mut [[f32; 3]], velocities: &[[f32; 3]]) {
    for (position, velocity) in positions.iter_mut().zip(velocities) {
        for axis in 0..3 {
            position[axis] += velocity[axis] * DT;
        }
    }
}
fn soa_flat_step(positions: &mut [[f32; 3]], velocities: &[[f32; 3]]) {
    for (position, velocity) in positions
        .as_flattened_mut()
        .iter_mut()
        .zip(velocities.as_flattened())
    {
        *position += *velocity * DT;
    }
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
fn soa_checksum(positions: &[[f32; 3]]) -> f64 {
    positions
        .iter()
        .map(|p| p.iter().map(|&x| x as f64).sum::<f64>())
        .sum()
}
fn aos_checksum(bodies: &[Body]) -> f64 {
    bodies
        .iter()
        .map(|body| body.position.0.iter().map(|&x| x as f64).sum::<f64>())
        .sum()
}

/// Jednakowe dane początkowe w każdej reprezentacji.
struct Data {
    world: World,
    soa_vec: (Vec<[f32; 3]>, Vec<[f32; 3]>),
    soa_flat: (Vec<[f32; 3]>, Vec<[f32; 3]>),
    bodies: Vec<Body>,
}
impl Data {
    fn new(count: usize) -> Self {
        let mut data = Self {
            world: World::new(),
            soa_vec: (Vec::with_capacity(count), Vec::with_capacity(count)),
            soa_flat: (Vec::with_capacity(count), Vec::with_capacity(count)),
            bodies: Vec::with_capacity(count),
        };
        for i in 0..count {
            let (position, velocity) = initial(i);
            data.world.spawn2(position, velocity).unwrap();
            data.soa_vec.0.push(position.0);
            data.soa_vec.1.push(velocity.0);
            data.soa_flat.0.push(position.0);
            data.soa_flat.1.push(velocity.0);
            data.bodies.push(Body { position, velocity });
        }
        data
    }
    fn run(&mut self, implementation: &str) {
        match implementation {
            "ecs_soa" => ecs_step(black_box(&mut self.world)),
            "soa_vec" => soa_vec_step(black_box(&mut self.soa_vec.0), black_box(&self.soa_vec.1)),
            "soa_flat" => {
                soa_flat_step(black_box(&mut self.soa_flat.0), black_box(&self.soa_flat.1))
            }
            _ => aos_step(black_box(&mut self.bodies)),
        }
    }
    fn checksum(&self, implementation: &str) -> f64 {
        match implementation {
            "ecs_soa" => ecs_checksum(&self.world),
            "soa_vec" => soa_checksum(&self.soa_vec.0),
            "soa_flat" => soa_checksum(&self.soa_flat.0),
            _ => aos_checksum(&self.bodies),
        }
    }
}

fn main() {
    if cfg!(debug_assertions) {
        eprintln!(
            "UWAGA: profil debug; miarodajne pomiary wymagają cargo run --release --bin benchmark_warianty"
        );
    }
    eprintln!("benchmark=position_velocity_integration_variants");
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
    // Zestaw instrukcji, dla którego skompilowano program (zależy od -C target-cpu).
    eprintln!(
        "compiled_target_features=sse4.1:{},avx:{},avx2:{},fma:{}",
        cfg!(target_feature = "sse4.1"),
        cfg!(target_feature = "avx"),
        cfg!(target_feature = "avx2"),
        cfg!(target_feature = "fma")
    );
    eprintln!("variants={}", VARIANTS.join(","));
    eprintln!("allocation_and_checksum_excluded=true; execution=single_thread; order=rotating; numbers=wall_clock_nanoseconds");
    println!("implementation,entities,sample,iterations,total_ns,ns_per_iteration,ns_per_entity,checksum");
    for count in [1_000, 10_000, 100_000] {
        let mut data = Data::new(count);
        for _ in 0..WARMUP {
            for implementation in VARIANTS {
                data.run(implementation);
            }
        }
        for sample in 0..SAMPLES {
            // Kolejność wariantów jest przesuwana cyklicznie, aby zmniejszyć wpływ
            // pozycji w serii na wynik.
            for offset in 0..VARIANTS.len() {
                let implementation = VARIANTS[(sample + offset) % VARIANTS.len()];
                let start = Instant::now();
                for _ in 0..ITERATIONS {
                    data.run(implementation);
                }
                let elapsed = start.elapsed().as_nanos();
                let checksum = black_box(data.checksum(implementation));
                let ns_per_iteration = elapsed as f64 / ITERATIONS as f64;
                println!("{implementation},{count},{sample},{ITERATIONS},{elapsed},{ns_per_iteration:.3},{:.6},{checksum:.6}", ns_per_iteration / count as f64);
            }
            let reference = data.checksum("vec_aos");
            let tolerance = 1e-6 * reference.abs().max(1.0);
            for implementation in VARIANTS {
                let sum = data.checksum(implementation);
                assert!(
                    (sum - reference).abs() <= tolerance,
                    "Niezgodne wyniki wariantów pomiarowych: {implementation}={sum}, vec_aos={reference}"
                );
            }
        }
    }
}
