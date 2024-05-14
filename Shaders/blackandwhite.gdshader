shader_type canvas_item;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
    float intensity = (color.r + color.g + color.b) / 3.0;
    vec3 grayscaleColor = vec3(intensity);
    COLOR.rgb = grayscaleColor;
    COLOR.a = color.a;
}