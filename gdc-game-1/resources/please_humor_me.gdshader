shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 ic = COLOR;
	float temp = ic.b;
	ic.b = ic.r;
	ic.g = ic.r;
	ic.r = temp;
	COLOR.rgb = ic.rgb;//textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
