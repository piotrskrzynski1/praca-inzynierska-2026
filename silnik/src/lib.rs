//! Mały silnik: bezpieczny archetypowy ECS, pula wątków, symulacja i renderer.
pub mod ecs;
pub mod game;
#[cfg(feature = "graphics")]
pub mod renderer;
pub mod thread_pool;
