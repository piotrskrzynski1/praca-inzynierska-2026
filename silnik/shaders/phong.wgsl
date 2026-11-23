struct Camera {
    view_projection: mat4x4<f32>,
    eye: vec4<f32>,
    light_direction: vec4<f32>,
};
@group(0) @binding(0) var<uniform> camera: Camera;

struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) model_0: vec4<f32>,
    @location(3) model_1: vec4<f32>,
    @location(4) model_2: vec4<f32>,
    @location(5) model_3: vec4<f32>,
    @location(6) normal_0: vec4<f32>,
    @location(7) normal_1: vec4<f32>,
    @location(8) normal_2: vec4<f32>,
    @location(9) color: vec4<f32>,
};

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) world_position: vec3<f32>,
    @location(1) world_normal: vec3<f32>,
    @location(2) color: vec4<f32>,
};

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    let model = mat4x4<f32>(input.model_0, input.model_1, input.model_2, input.model_3);
    let normal_matrix = mat3x3<f32>(input.normal_0.xyz, input.normal_1.xyz, input.normal_2.xyz);
    let world = model * vec4<f32>(input.position, 1.0);
    var output: VertexOutput;
    output.clip_position = camera.view_projection * world;
    output.world_position = world.xyz;
    output.world_normal = normal_matrix * input.normal;
    output.color = input.color;
    return output;
}

@fragment
fn fs_main(input: VertexOutput) -> @location(0) vec4<f32> {
    let normal = normalize(input.world_normal);
    let light = normalize(camera.light_direction.xyz);
    let view = normalize(camera.eye.xyz - input.world_position);
    let reflected = reflect(-light, normal);
    let diffuse = max(dot(normal, light), 0.0);
    // Model Phonga: odbity wektor światła, bez wektora połówkowego Blinna.
    var specular = 0.0;
    if diffuse > 0.0 {
        specular = pow(max(dot(reflected, view), 0.0), 32.0);
    }
    var base = input.color.rgb;
    // Alpha=0 jest znacznikiem proceduralnej podłogi; wynik jest nieprzezroczysty.
    if input.color.a < 0.5 {
        let cell = i32(floor(input.world_position.x / 2.0) + floor(input.world_position.z / 2.0));
        if (cell & 1) == 0 { base *= 0.84; }
    }
    let lit = base * (0.24 + 0.72 * diffuse) + vec3<f32>(0.32 * specular);
    return vec4<f32>(lit, 1.0);
}
