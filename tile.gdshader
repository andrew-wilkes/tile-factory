shader_type canvas_item;

uniform float edge_width = 0.1;
uniform vec4 contrast = vec4(0.8, 0.6, 0.4, 0.2);
uniform vec3 color: source_color = vec3(1.0);

void fragment() {
	vec3 col = vec3(1.0);

	float dist_from_diag = abs(UV.x - UV.y);
	col -= vec3(dist_from_diag * 0.4);

	float edge_dist = min(UV.x, min(1.0 - UV.x, min(UV.y, 1.0 - UV.y)));

	vec3 edge_col;
	if (UV.x > UV.y) {
		edge_col = mix(vec3(contrast.r), vec3(contrast.g), step(1.0 - UV.x, UV.y));
	} else {
		edge_col = mix(vec3(contrast.b), vec3(contrast.a), step(1.0 - UV.y, UV.x));
	}
	col = mix(col, edge_col, step(edge_dist, edge_width));
	COLOR = vec4(col * color, 1.0);

}
