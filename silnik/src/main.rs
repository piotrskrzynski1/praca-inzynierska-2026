use glam::Vec2;
use rust_ecs_3d::{
    game::{Game, Input, FIXED_DT},
    renderer::{render_offscreen, Renderer},
};
use std::{collections::HashSet, path::Path, sync::Arc, time::Instant};
use winit::{
    dpi::LogicalSize,
    event::{ElementState, Event, WindowEvent},
    event_loop::{ControlFlow, EventLoop},
    keyboard::{KeyCode, PhysicalKey},
    window::WindowBuilder,
};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args: Vec<String> = std::env::args().skip(1).collect();
    if args.first().is_some_and(|s| s == "--offscreen") {
        let path = args
            .get(1)
            .ok_or("użycie: survivor3d --offscreen obraz.png")?;
        let adapter = pollster::block_on(render_offscreen(Path::new(path)))?;
        println!("Zapisano {path}. Adapter: {adapter}. Walidacja wgpu: bez błędów.");
        return Ok(());
    }
    let frame_limit: Option<u64> = if args.first().is_some_and(|s| s == "--frames") {
        Some(args.get(1).ok_or("oczekiwano liczby klatek")?.parse()?)
    } else if args.is_empty() {
        None
    } else {
        return Err("użycie: survivor3d [--frames N | --offscreen obraz.png]".into());
    };
    let event_loop = EventLoop::new()?;
    let window = Arc::new(
        WindowBuilder::new()
            .with_title("Silnik 3D ECS — Arena przetrwania")
            .with_inner_size(LogicalSize::new(1280.0, 800.0))
            .with_min_inner_size(LogicalSize::new(640.0, 480.0))
            .build(&event_loop)?,
    );
    let mut renderer = pollster::block_on(Renderer::new(window.clone()))?;
    println!("GPU: {}", renderer.adapter_name);
    let workers = std::thread::available_parallelism()
        .map_or(2, |n| n.get())
        .clamp(1, 4);
    let mut game = Game::new(workers);
    let mut keys = HashSet::new();
    let mut previous = Instant::now();
    let mut accumulator = 0.0_f32;
    let mut smoothed_dt = FIXED_DT;
    let mut frames = 0_u64;

    event_loop.run(move |event, target| {
        target.set_control_flow(if renderer.minimized {
            ControlFlow::Wait
        } else {
            ControlFlow::Poll
        });
        match event {
            Event::WindowEvent { event, window_id } if window_id == window.id() => {
                let consumed = renderer.handle_event(&window, &event);
                match event {
                    WindowEvent::CloseRequested => target.exit(),
                    WindowEvent::Resized(size) => renderer.resize(size),
                    WindowEvent::ScaleFactorChanged { .. } => renderer.resize(window.inner_size()),
                    WindowEvent::Focused(false) => {
                        keys.clear();
                        game.paused = true;
                    }
                    WindowEvent::KeyboardInput { event, .. } => {
                        if let PhysicalKey::Code(code) = event.physical_key {
                            if event.state == ElementState::Released {
                                keys.remove(&code);
                            }
                            if !consumed && event.state == ElementState::Pressed {
                                keys.insert(code);
                                if !event.repeat {
                                    match code {
                                        KeyCode::Space if !game.is_over() => {
                                            game.paused = !game.paused
                                        }
                                        KeyCode::KeyR => {
                                            game.restart();
                                            accumulator = 0.0;
                                        }
                                        KeyCode::Escape => target.exit(),
                                        _ => (),
                                    }
                                }
                            }
                        }
                    }
                    WindowEvent::RedrawRequested => {
                        let now = Instant::now();
                        let frame_dt = (now - previous).as_secs_f32();
                        previous = now;
                        smoothed_dt = smoothed_dt * 0.9 + frame_dt * 0.1;
                        if game.paused || game.is_over() || renderer.minimized {
                            accumulator = 0.0;
                        } else {
                            accumulator += frame_dt.min(0.25);
                            let input = if renderer.context.wants_keyboard_input() {
                                Input::default()
                            } else {
                                let down = |a, b| keys.contains(&a) || keys.contains(&b);
                                Input {
                                    movement: Vec2::new(
                                        down(KeyCode::KeyD, KeyCode::ArrowRight) as u8 as f32
                                            - down(KeyCode::KeyA, KeyCode::ArrowLeft) as u8 as f32,
                                        down(KeyCode::KeyS, KeyCode::ArrowDown) as u8 as f32
                                            - down(KeyCode::KeyW, KeyCode::ArrowUp) as u8 as f32,
                                    ),
                                }
                            };
                            while accumulator >= FIXED_DT {
                                game.step(FIXED_DT, input);
                                accumulator -= FIXED_DT;
                            }
                        }
                        match renderer.render(&window, &mut game, smoothed_dt) {
                            Ok(()) => (),
                            Err(wgpu::SurfaceError::Lost | wgpu::SurfaceError::Outdated) => {
                                renderer.resize(window.inner_size())
                            }
                            Err(wgpu::SurfaceError::OutOfMemory) => {
                                eprintln!("GPU: brak pamięci; zamykam aplikację.");
                                target.exit();
                            }
                            Err(wgpu::SurfaceError::Timeout) => {
                                eprintln!("GPU: przekroczono czas pobrania klatki; ponawiam.")
                            }
                        }
                        frames += 1;
                        if frame_limit.is_some_and(|limit| frames >= limit) {
                            target.exit();
                        }
                    }
                    _ => (),
                }
            }
            Event::AboutToWait if !renderer.minimized => window.request_redraw(),
            _ => (),
        }
    })?;
    Ok(())
}
