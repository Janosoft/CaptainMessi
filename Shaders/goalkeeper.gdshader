shader_type canvas_item;
const vec4 SKIN = vec4(0.996, 0.8, 0.773, 1);
const vec4 HAIR = vec4(0.6, 0.306, 0.0, 1.0);
const vec4 SHIRT_1 = vec4(0.082, 0.373, 0.851, 1.0);
const vec4 SHIRT_2 = vec4(0.392, 0.690, 1.0, 1.0);
uniform vec4 Skin : source_color;
uniform vec4 Hair : source_color;
uniform vec4 Shirt_1 : source_color;
uniform vec4 Shirt_2 : source_color;

void fragment() {
	if (texture(TEXTURE, UV).a < 0.01) COLOR = texture(TEXTURE, UV) ;
	else if (distance(texture(TEXTURE,UV).rgb,SKIN.rgb)<0.1) COLOR = Skin;
	else if (distance(texture(TEXTURE,UV).rgb,HAIR.rgb)<0.1) COLOR = Hair;
	else if (distance(texture(TEXTURE,UV).rgb,SHIRT_1.rgb)<0.1) COLOR = Shirt_1;
	else if (distance(texture(TEXTURE,UV).rgb,SHIRT_2.rgb)<0.1) COLOR = Shirt_2;
	
}
