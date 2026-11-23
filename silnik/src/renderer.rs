//! Prosty instancjonowany potok 3D: perspektywa, głębokość, Phong, egui.
use crate::game::{Game, RenderItem, ARENA_HALF_SIZE, FIXED_DT};
use bytemuck::{Pod, Zeroable};
use glam::{Mat4, Vec3};
use std::{fs::File, io::BufWriter, path::Path, sync::Arc};
use wgpu::util::DeviceExt;
use winit::{dpi::PhysicalSize, event::WindowEvent, window::Window};

const DEPTH_FORMAT: wgpu::TextureFormat = wgpu::TextureFormat::Depth32Float;
const BACKGROUND: wgpu::Color = wgpu::Color {
    r: 0.025,
    g: 0.045,
    b: 0.07,
    a: 1.0,
};
const PANEL: egui::Color32 = egui::Color32::from_rgb(23, 39, 54);
const ACCENT: egui::Color32 = egui::Color32::from_rgb(49, 169, 198);

#[repr(C)]
#[derive(Clone, Copy, Pod, Zeroable)]
struct Vertex {
    position: [f32; 3],
    normal: [f32; 3],
}
impl Vertex {
    fn layout() -> wgpu::VertexBufferLayout<'static> {
        const ATTRS: [wgpu::VertexAttribute; 2] =
            wgpu::vertex_attr_array![0 => Float32x3, 1 => Float32x3];
        wgpu::VertexBufferLayout {
            array_stride: std::mem::size_of::<Self>() as u64,
            step_mode: wgpu::VertexStepMode::Vertex,
            attributes: &ATTRS,
        }
    }
}

#[repr(C)]
#[derive(Clone, Copy, Pod, Zeroable)]
struct Instance {
    model: [[f32; 4]; 4],
    normal: [[f32; 4]; 3],
    color: [f32; 4],
}
impl Instance {
    fn new(item: RenderItem) -> Self {
        let model =
            Mat4::from_scale_rotation_translation(item.scale, glam::Quat::IDENTITY, item.position);
        let inv = |s: f32| if s != 0.0 { 1.0 / s } else { 0.0 };
        Self {
            model: model.to_cols_array_2d(),
            normal: [
                [inv(item.scale.x), 0.0, 0.0, 0.0],
                [0.0, inv(item.scale.y), 0.0, 0.0],
                [0.0, 0.0, inv(item.scale.z), 0.0],
            ],
            color: item.color,
        }
    }
    fn layout() -> wgpu::VertexBufferLayout<'static> {
        const ATTRS: [wgpu::VertexAttribute; 8] = wgpu::vertex_attr_array![2 => Float32x4, 3 => Float32x4, 4 => Float32x4, 5 => Float32x4, 6 => Float32x4, 7 => Float32x4, 8 => Float32x4, 9 => Float32x4];
        wgpu::VertexBufferLayout {
            array_stride: std::mem::size_of::<Self>() as u64,
            step_mode: wgpu::VertexStepMode::Instance,
            attributes: &ATTRS,
        }
    }
}

#[repr(C)]
#[derive(Clone, Copy, Pod, Zeroable)]
struct Camera {
    view_projection: [[f32; 4]; 4],
    eye: [f32; 4],
    light_direction: [f32; 4],
}

/// GPU resources shared by the window and the offscreen diagnostic path.
struct Scene {
    pipeline: wgpu::RenderPipeline,
    vertices: wgpu::Buffer,
    indices: wgpu::Buffer,
    index_count: u32,
    instances: wgpu::Buffer,
    instance_scratch: Vec<Instance>,
    capacity: usize,
    instance_count: u32,
    camera: wgpu::Buffer,
    camera_group: wgpu::BindGroup,
}

impl Scene {
    fn new(device: &wgpu::Device, format: wgpu::TextureFormat) -> Self {
        let (vertices, indices) = cube_mesh();
        let vertex_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("cube vertices"),
            contents: bytemuck::cast_slice(&vertices),
            usage: wgpu::BufferUsages::VERTEX,
        });
        let index_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("cube indices"),
            contents: bytemuck::cast_slice(&indices),
            usage: wgpu::BufferUsages::INDEX,
        });
        let camera = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("camera"),
            size: std::mem::size_of::<Camera>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        let camera_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("camera layout"),
            entries: &[wgpu::BindGroupLayoutEntry {
                binding: 0,
                visibility: wgpu::ShaderStages::VERTEX_FRAGMENT,
                ty: wgpu::BindingType::Buffer {
                    ty: wgpu::BufferBindingType::Uniform,
                    has_dynamic_offset: false,
                    min_binding_size: None,
                },
                count: None,
            }],
        });
        let camera_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("camera group"),
            layout: &camera_layout,
            entries: &[wgpu::BindGroupEntry {
                binding: 0,
                resource: camera.as_entire_binding(),
            }],
        });
        let shader = device.create_shader_module(wgpu::include_wgsl!("../shaders/phong.wgsl"));
        let layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Phong layout"),
            bind_group_layouts: &[&camera_layout],
            push_constant_ranges: &[],
        });
        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Phong instanced cubes"),
            layout: Some(&layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[Vertex::layout(), Instance::layout()],
                compilation_options: Default::default(),
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format,
                    blend: None,
                    write_mask: wgpu::ColorWrites::ALL,
                })],
                compilation_options: Default::default(),
            }),
            primitive: wgpu::PrimitiveState {
                cull_mode: Some(wgpu::Face::Back),
                ..Default::default()
            },
            depth_stencil: Some(wgpu::DepthStencilState {
                format: DEPTH_FORMAT,
                depth_write_enabled: true,
                depth_compare: wgpu::CompareFunction::Less,
                stencil: Default::default(),
                bias: Default::default(),
            }),
            multisample: Default::default(),
            multiview: None,
        });
        let capacity = 128;
        Self {
            pipeline,
            vertices: vertex_buffer,
            indices: index_buffer,
            index_count: indices.len() as u32,
            instances: instance_buffer(device, capacity),
            instance_scratch: Vec::with_capacity(capacity),
            capacity,
            instance_count: 0,
            camera,
            camera_group,
        }
    }

    fn update(
        &mut self,
        device: &wgpu::Device,
        queue: &wgpu::Queue,
        game: &Game,
        width: u32,
        height: u32,
    ) {
        let target = game.player_position();
        let eye = Vec3::new(target.x, 25.0, target.z + 22.0);
        let view = Mat4::look_at_rh(eye, Vec3::new(target.x, 0.0, target.z), Vec3::Y);
        // glam::perspective_rh uses WebGPU's 0..1 depth range.
        let projection = Mat4::perspective_rh(
            48.0_f32.to_radians(),
            width as f32 / height.max(1) as f32,
            0.1,
            150.0,
        );
        let camera = Camera {
            view_projection: (projection * view).to_cols_array_2d(),
            eye: eye.extend(1.0).to_array(),
            light_direction: Vec3::new(-0.35, 0.9, 0.4)
                .normalize()
                .extend(0.0)
                .to_array(),
        };
        queue.write_buffer(&self.camera, 0, bytemuck::bytes_of(&camera));
        self.instance_scratch.clear();
        game.for_each_render_item(|item| self.instance_scratch.push(Instance::new(item)));
        self.instance_scratch.push(Instance::new(RenderItem {
            position: Vec3::new(0.0, -0.15, 0.0),
            scale: Vec3::new(ARENA_HALF_SIZE * 2.0, 0.3, ARENA_HALF_SIZE * 2.0),
            color: [0.16, 0.23, 0.29, 0.0],
        }));
        for sign in [-1.0, 1.0] {
            self.instance_scratch.push(Instance::new(RenderItem {
                position: Vec3::new(sign * ARENA_HALF_SIZE, 0.15, 0.0),
                scale: Vec3::new(0.15, 0.3, ARENA_HALF_SIZE * 2.0),
                color: [0.32, 0.45, 0.5, 1.0],
            }));
            self.instance_scratch.push(Instance::new(RenderItem {
                position: Vec3::new(0.0, 0.15, sign * ARENA_HALF_SIZE),
                scale: Vec3::new(ARENA_HALF_SIZE * 2.0, 0.3, 0.15),
                color: [0.32, 0.45, 0.5, 1.0],
            }));
        }
        if self.instance_scratch.len() > self.capacity {
            self.capacity = self.instance_scratch.len().next_power_of_two();
            self.instances = instance_buffer(device, self.capacity);
        }
        self.instance_count = self.instance_scratch.len() as u32;
        queue.write_buffer(
            &self.instances,
            0,
            bytemuck::cast_slice(&self.instance_scratch),
        );
    }

    fn draw(
        &self,
        encoder: &mut wgpu::CommandEncoder,
        view: &wgpu::TextureView,
        depth: &wgpu::TextureView,
    ) {
        let mut pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
            label: Some("scene"),
            color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                view,
                resolve_target: None,
                ops: wgpu::Operations {
                    load: wgpu::LoadOp::Clear(BACKGROUND),
                    store: wgpu::StoreOp::Store,
                },
            })],
            depth_stencil_attachment: Some(wgpu::RenderPassDepthStencilAttachment {
                view: depth,
                depth_ops: Some(wgpu::Operations {
                    load: wgpu::LoadOp::Clear(1.0),
                    store: wgpu::StoreOp::Store,
                }),
                stencil_ops: None,
            }),
            timestamp_writes: None,
            occlusion_query_set: None,
        });
        pass.set_pipeline(&self.pipeline);
        pass.set_bind_group(0, &self.camera_group, &[]);
        pass.set_vertex_buffer(0, self.vertices.slice(..));
        pass.set_vertex_buffer(1, self.instances.slice(..));
        pass.set_index_buffer(self.indices.slice(..), wgpu::IndexFormat::Uint16);
        pass.draw_indexed(0..self.index_count, 0, 0..self.instance_count);
    }
}

fn instance_buffer(device: &wgpu::Device, capacity: usize) -> wgpu::Buffer {
    device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("instances"),
        size: (capacity * std::mem::size_of::<Instance>()) as u64,
        usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
        mapped_at_creation: false,
    })
}

fn depth_view(device: &wgpu::Device, width: u32, height: u32) -> wgpu::TextureView {
    device
        .create_texture(&wgpu::TextureDescriptor {
            label: Some("depth"),
            size: wgpu::Extent3d {
                width: width.max(1),
                height: height.max(1),
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: DEPTH_FORMAT,
            usage: wgpu::TextureUsages::RENDER_ATTACHMENT,
            view_formats: &[],
        })
        .create_view(&Default::default())
}

fn cube_mesh() -> (Vec<Vertex>, Vec<u16>) {
    let faces = [
        (
            [0.0, 0.0, 1.0],
            [
                [-0.5, -0.5, 0.5],
                [0.5, -0.5, 0.5],
                [0.5, 0.5, 0.5],
                [-0.5, 0.5, 0.5],
            ],
        ),
        (
            [0.0, 0.0, -1.0],
            [
                [0.5, -0.5, -0.5],
                [-0.5, -0.5, -0.5],
                [-0.5, 0.5, -0.5],
                [0.5, 0.5, -0.5],
            ],
        ),
        (
            [1.0, 0.0, 0.0],
            [
                [0.5, -0.5, 0.5],
                [0.5, -0.5, -0.5],
                [0.5, 0.5, -0.5],
                [0.5, 0.5, 0.5],
            ],
        ),
        (
            [-1.0, 0.0, 0.0],
            [
                [-0.5, -0.5, -0.5],
                [-0.5, -0.5, 0.5],
                [-0.5, 0.5, 0.5],
                [-0.5, 0.5, -0.5],
            ],
        ),
        (
            [0.0, 1.0, 0.0],
            [
                [-0.5, 0.5, 0.5],
                [0.5, 0.5, 0.5],
                [0.5, 0.5, -0.5],
                [-0.5, 0.5, -0.5],
            ],
        ),
        (
            [0.0, -1.0, 0.0],
            [
                [-0.5, -0.5, -0.5],
                [0.5, -0.5, -0.5],
                [0.5, -0.5, 0.5],
                [-0.5, -0.5, 0.5],
            ],
        ),
    ];
    let mut vertices = Vec::with_capacity(24);
    let mut indices = Vec::with_capacity(36);
    for (normal, positions) in faces {
        let offset = vertices.len() as u16;
        vertices.extend(positions.map(|position| Vertex { position, normal }));
        indices.extend([
            offset,
            offset + 1,
            offset + 2,
            offset,
            offset + 2,
            offset + 3,
        ]);
    }
    (vertices, indices)
}

pub struct Renderer {
    surface: wgpu::Surface<'static>,
    pub device: wgpu::Device,
    queue: wgpu::Queue,
    config: wgpu::SurfaceConfiguration,
    depth: wgpu::TextureView,
    scene: Scene,
    pub context: egui::Context,
    ui_state: egui_winit::State,
    ui_renderer: egui_wgpu::Renderer,
    pub adapter_name: String,
    pub minimized: bool,
}

impl Renderer {
    pub async fn new(window: Arc<Window>) -> Result<Self, Box<dyn std::error::Error>> {
        let instance = wgpu::Instance::default();
        let surface = instance.create_surface(window.clone())?;
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                compatible_surface: Some(&surface),
                force_fallback_adapter: false,
            })
            .await
            .ok_or("brak zgodnego adaptera GPU")?;
        let (device, queue) = adapter
            .request_device(
                &wgpu::DeviceDescriptor {
                    label: Some("engine"),
                    required_features: wgpu::Features::empty(),
                    required_limits: wgpu::Limits::default(),
                },
                None,
            )
            .await?;
        let size = window.inner_size();
        let caps = surface.get_capabilities(&adapter);
        let format = caps
            .formats
            .iter()
            .find(|f| f.is_srgb())
            .copied()
            .unwrap_or(caps.formats[0]);
        let config = wgpu::SurfaceConfiguration {
            usage: wgpu::TextureUsages::RENDER_ATTACHMENT,
            format,
            width: size.width.max(1),
            height: size.height.max(1),
            present_mode: wgpu::PresentMode::Fifo,
            alpha_mode: caps.alpha_modes[0],
            view_formats: vec![],
            desired_maximum_frame_latency: 2,
        };
        surface.configure(&device, &config);
        let depth = depth_view(&device, config.width, config.height);
        let scene = Scene::new(&device, format);
        let context = egui::Context::default();
        apply_theme(&context);
        let ui_state = egui_winit::State::new(
            context.clone(),
            egui::ViewportId::ROOT,
            window.as_ref(),
            Some(window.scale_factor() as f32),
            None,
        );
        let ui_renderer = egui_wgpu::Renderer::new(&device, format, None, 1);
        let info = adapter.get_info();
        Ok(Self {
            surface,
            device,
            queue,
            config,
            depth,
            scene,
            context,
            ui_state,
            ui_renderer,
            adapter_name: format!("{} ({:?})", info.name, info.backend),
            minimized: size.width == 0 || size.height == 0,
        })
    }

    pub fn handle_event(&mut self, window: &Window, event: &WindowEvent) -> bool {
        self.ui_state.on_window_event(window, event).consumed
    }

    pub fn resize(&mut self, size: PhysicalSize<u32>) {
        self.minimized = size.width == 0 || size.height == 0;
        if self.minimized {
            return;
        }
        self.config.width = size.width;
        self.config.height = size.height;
        self.surface.configure(&self.device, &self.config);
        self.depth = depth_view(&self.device, size.width, size.height);
    }

    pub fn render(
        &mut self,
        window: &Window,
        game: &mut Game,
        frame_seconds: f32,
    ) -> Result<(), wgpu::SurfaceError> {
        if self.minimized {
            return Ok(());
        }
        let frame = self.surface.get_current_texture()?;
        let view = frame.texture.create_view(&Default::default());
        let input = self.ui_state.take_egui_input(window);
        let output = self.context.run(input, |ctx| {
            debug_panel(ctx, game, frame_seconds, &self.adapter_name);
        });
        self.ui_state
            .handle_platform_output(window, output.platform_output);
        let jobs = self
            .context
            .tessellate(output.shapes, output.pixels_per_point);
        let screen = egui_wgpu::ScreenDescriptor {
            size_in_pixels: [self.config.width, self.config.height],
            pixels_per_point: output.pixels_per_point,
        };
        for (id, delta) in &output.textures_delta.set {
            self.ui_renderer
                .update_texture(&self.device, &self.queue, *id, delta);
        }
        self.scene.update(
            &self.device,
            &self.queue,
            game,
            self.config.width,
            self.config.height,
        );
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("frame"),
            });
        let extra = self.ui_renderer.update_buffers(
            &self.device,
            &self.queue,
            &mut encoder,
            &jobs,
            &screen,
        );
        self.scene.draw(&mut encoder, &view, &self.depth);
        {
            let mut pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                label: Some("diagnostics"),
                color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                    view: &view,
                    resolve_target: None,
                    ops: wgpu::Operations {
                        load: wgpu::LoadOp::Load,
                        store: wgpu::StoreOp::Store,
                    },
                })],
                depth_stencil_attachment: None,
                timestamp_writes: None,
                occlusion_query_set: None,
            });
            self.ui_renderer.render(&mut pass, &jobs, &screen);
        }
        self.queue
            .submit(extra.into_iter().chain(std::iter::once(encoder.finish())));
        frame.present();
        for id in &output.textures_delta.free {
            self.ui_renderer.free_texture(id);
        }
        Ok(())
    }
}

fn apply_theme(context: &egui::Context) {
    let mut visuals = egui::Visuals::dark();
    visuals.window_fill = PANEL;
    visuals.panel_fill = PANEL;
    visuals.selection.bg_fill = ACCENT;
    visuals.widgets.active.bg_fill = ACCENT;
    visuals.widgets.hovered.bg_stroke = egui::Stroke::new(1.5, ACCENT);
    context.set_visuals(visuals);
    let mut style = (*context.style()).clone();
    style.spacing.button_padding = egui::vec2(12.0, 7.0);
    style
        .text_styles
        .insert(egui::TextStyle::Heading, egui::FontId::proportional(22.0));
    style
        .text_styles
        .insert(egui::TextStyle::Body, egui::FontId::proportional(15.0));
    style
        .text_styles
        .insert(egui::TextStyle::Monospace, egui::FontId::monospace(14.0));
    context.set_style(style);
}

fn debug_panel(ctx: &egui::Context, game: &mut Game, frame_seconds: f32, adapter: &str) {
    egui::Window::new("Silnik 3D · ECS")
        .default_pos(egui::pos2(16.0, 16.0))
        .default_width(265.0)
        .default_height(550.0)
        .max_height((ctx.screen_rect().height() - 60.0).max(120.0))
        .vscroll(true)
        .resizable(false)
        .collapsible(true)
        .show(ctx, |ui| {
            ui.heading("Arena przetrwania");
            ui.label("WASD / strzałki: ruch\nSpacja: pauza · R: od nowa");
            ui.separator();
            let status = if game.is_over() {
                "Koniec gry"
            } else if game.paused {
                "Pauza"
            } else {
                "Gra trwa"
            };
            ui.strong(status);
            ui.add(
                egui::ProgressBar::new(game.health() / 100.0)
                    .text(format!("Zdrowie: {:.0} / 100", game.health())),
            );
            ui.label(format!("Wynik: {}   Czas: {:.1} s", game.score, game.time));
            ui.add(
                egui::ProgressBar::new(game.xp as f32 / game.xp_to_next_level() as f32).text(
                    format!(
                        "Poziom {} · XP: {} / {}",
                        game.level,
                        game.xp,
                        game.xp_to_next_level()
                    ),
                ),
            );
            let projectiles = game.projectile_count();
            let noun = match projectiles {
                1 => "pocisk",
                2..=4 => "pociski",
                _ => "pocisków",
            };
            ui.label(format!(
                "Salwa: {projectiles} {noun} · co {:.2} s",
                game.fire_interval()
            ));
            ui.small(match game.next_volley_upgrade_level() {
                Some(level) => format!("Kolejny pocisk: poziom {level}. Zbieraj zielone kostki."),
                None => "Maksymalna salwa: 5 pocisków. Awans przyspiesza strzały.".into(),
            });
            ui.horizontal(|ui| {
                if ui
                    .add_enabled(
                        !game.is_over(),
                        egui::Button::new(if game.paused { "Wznów" } else { "Pauza" }),
                    )
                    .clicked()
                {
                    game.paused = !game.paused;
                }
                if ui.button("Od nowa").clicked() {
                    game.restart();
                }
            });
            ui.separator();
            egui::Grid::new("diagnostic_metrics")
                .num_columns(2)
                .spacing([16.0, 5.0])
                .show(ui, |ui| {
                    metric(
                        ui,
                        "FPS",
                        if frame_seconds > 0.0 {
                            format!("{:.0}", 1.0 / frame_seconds)
                        } else {
                            "—".into()
                        },
                    );
                    metric(
                        ui,
                        "Odstęp klatek",
                        if frame_seconds > 0.0 {
                            format!("{:.2} ms", frame_seconds * 1000.0)
                        } else {
                            "—".into()
                        },
                    );
                    metric(ui, "Encje", game.world.entity_count().to_string());
                    metric(ui, "Archetypy", game.world.archetype_count().to_string());
                    metric(ui, "Przeciwnicy", game.enemies().to_string());
                    metric(
                        ui,
                        "Napływ przeciwników",
                        format!("{} / {:.2} s", game.wave_size(), game.wave_interval()),
                    );
                    metric(ui, "Pracownicy puli", game.workers.to_string());
                    metric(ui, "Zadania AI", game.parallel_batches.to_string());
                });
            ui.small("Krok symulacji: 60 Hz · Phong · instancing");
            ui.small(adapter);
            ui.small(if frame_seconds > 0.0 {
                "FPS obejmuje VSync. Panel nie mierzy czasu GPU."
            } else {
                "Obraz offscreen. Pomiar FPS niedostępny."
            });
        });
}

fn metric(ui: &mut egui::Ui, label: &str, value: String) {
    ui.label(label);
    ui.monospace(value);
    ui.end_row();
}

/// Rzeczywista walidacja GPU bez widocznego okna. Zapisuje scenę i panel do PNG.
pub async fn render_offscreen(path: &Path) -> Result<String, Box<dyn std::error::Error>> {
    const WIDTH: u32 = 1280;
    const HEIGHT: u32 = 800;
    let instance = wgpu::Instance::default();
    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
        .ok_or("brak adaptera GPU do renderowania offscreen")?;
    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("offscreen validation"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await?;
    device.push_error_scope(wgpu::ErrorFilter::Validation);
    let format = wgpu::TextureFormat::Rgba8UnormSrgb;
    let texture = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("offscreen color"),
        size: wgpu::Extent3d {
            width: WIDTH,
            height: HEIGHT,
            depth_or_array_layers: 1,
        },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format,
        usage: wgpu::TextureUsages::RENDER_ATTACHMENT | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    });
    let view = texture.create_view(&Default::default());
    let depth = depth_view(&device, WIDTH, HEIGHT);
    let mut game = Game::new(2);
    game.add_enemies(40);
    for _ in 0..240 {
        game.step(FIXED_DT, Default::default());
    }
    let mut scene = Scene::new(&device, format);
    scene.update(&device, &queue, &game, WIDTH, HEIGHT);
    let ctx = egui::Context::default();
    apply_theme(&ctx);
    let adapter_name = format!(
        "{} ({:?})",
        adapter.get_info().name,
        adapter.get_info().backend
    );
    let mut input = egui::RawInput {
        time: Some(0.0),
        screen_rect: Some(egui::Rect::from_min_size(
            egui::Pos2::ZERO,
            egui::vec2(WIDTH as f32, HEIGHT as f32),
        )),
        ..Default::default()
    };
    // egui needs an initial layout pass before the first visible window frame.
    let first = ctx.run(input.clone(), |context| {
        debug_panel(context, &mut game, 0.0, &adapter_name);
    });
    // Finish the fade and let the scrollable window settle its measured size.
    input.time = Some(1.0);
    let layout = ctx.run(input.clone(), |context| {
        debug_panel(context, &mut game, 0.0, &adapter_name);
    });
    input.time = Some(1.1);
    let output = ctx.run(input, |context| {
        debug_panel(context, &mut game, 0.0, &adapter_name);
    });
    let jobs = ctx.tessellate(output.shapes, output.pixels_per_point);
    let mut ui = egui_wgpu::Renderer::new(&device, format, None, 1);
    for (id, delta) in first
        .textures_delta
        .set
        .iter()
        .chain(layout.textures_delta.set.iter())
        .chain(output.textures_delta.set.iter())
    {
        ui.update_texture(&device, &queue, *id, delta);
    }
    let screen = egui_wgpu::ScreenDescriptor {
        size_in_pixels: [WIDTH, HEIGHT],
        pixels_per_point: output.pixels_per_point,
    };
    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("offscreen frame"),
    });
    let extra = ui.update_buffers(&device, &queue, &mut encoder, &jobs, &screen);
    scene.draw(&mut encoder, &view, &depth);
    {
        let mut pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
            label: Some("offscreen diagnostics"),
            color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                view: &view,
                resolve_target: None,
                ops: wgpu::Operations {
                    load: wgpu::LoadOp::Load,
                    store: wgpu::StoreOp::Store,
                },
            })],
            depth_stencil_attachment: None,
            timestamp_writes: None,
            occlusion_query_set: None,
        });
        ui.render(&mut pass, &jobs, &screen);
    }
    let row_bytes = WIDTH * 4;
    let padded =
        row_bytes.div_ceil(wgpu::COPY_BYTES_PER_ROW_ALIGNMENT) * wgpu::COPY_BYTES_PER_ROW_ALIGNMENT;
    let buffer = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("offscreen readback"),
        size: padded as u64 * HEIGHT as u64,
        usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
        mapped_at_creation: false,
    });
    encoder.copy_texture_to_buffer(
        wgpu::ImageCopyTexture {
            texture: &texture,
            mip_level: 0,
            origin: wgpu::Origin3d::ZERO,
            aspect: wgpu::TextureAspect::All,
        },
        wgpu::ImageCopyBuffer {
            buffer: &buffer,
            layout: wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(padded),
                rows_per_image: Some(HEIGHT),
            },
        },
        wgpu::Extent3d {
            width: WIDTH,
            height: HEIGHT,
            depth_or_array_layers: 1,
        },
    );
    queue.submit(extra.into_iter().chain(std::iter::once(encoder.finish())));
    let slice = buffer.slice(..);
    let (tx, rx) = std::sync::mpsc::channel();
    slice.map_async(wgpu::MapMode::Read, move |result| {
        let _ = tx.send(result);
    });
    device.poll(wgpu::Maintain::Wait);
    rx.recv()??;
    if let Some(error) = device.pop_error_scope().await {
        return Err(error.into());
    }
    let mapped = slice.get_mapped_range();
    let mut rgba = Vec::with_capacity((row_bytes * HEIGHT) as usize);
    for row in mapped.chunks(padded as usize) {
        rgba.extend_from_slice(&row[..row_bytes as usize]);
    }
    drop(mapped);
    buffer.unmap();
    let writer = BufWriter::new(File::create(path)?);
    let mut png = png::Encoder::new(writer, WIDTH, HEIGHT);
    png.set_color(png::ColorType::Rgba);
    png.set_depth(png::BitDepth::Eight);
    png.write_header()?.write_image_data(&rgba)?;
    Ok(adapter_name)
}
