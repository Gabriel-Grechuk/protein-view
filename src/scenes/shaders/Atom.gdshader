shader_type spatial;
uniform sampler2D noise;

void fragment() {
	// ALBEDO = vec3(0.1, 0.3, 0.5);
}

void vertex() {
	VERTEX.y += sin(VERTEX.x * 4.0) * sin(VERTEX.z);
}