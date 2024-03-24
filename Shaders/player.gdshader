shader_type canvas_item;
const vec4 SKIN = vec4(0.996, 0.8, 0.773, 1);
const vec4 HAIR = vec4(0.6, 0.306, 0.0, 1.0);
const vec4 SHIRT_1 = vec4(0.392, 0.69, 1.0, 1.0);
const vec4 SHIRT_2 = vec4(0.373, 0.804, 0.894, 1.0);
const vec4 PANT = vec4(0.082, 0.373, 0.851, 1.0);
const vec4 SOCKS_1 = vec4(0.675, 0.196, 0.196, 1.0);
const vec4 SOCKS_2 = vec4(0.851, 0.341, 0.388, 1.0);
uniform vec4 Skin : source_color;
uniform vec4 Hair : source_color;
uniform vec4 Shirt_1 : source_color;
uniform vec4 Shirt_2 : source_color;
uniform vec4 Pant : source_color;
uniform vec4 Socks_1 : source_color;
uniform vec4 Socks_2 : source_color;


void fragment() {
	if (distance(texture(TEXTURE,UV).rgb,SKIN.rgb)<0.1) COLOR = Skin;
	else if (distance(texture(TEXTURE,UV).rgb,HAIR.rgb)<0.1) COLOR = Hair;
	else if (distance(texture(TEXTURE,UV).rgb,SHIRT_1.rgb)<0.1) COLOR = Shirt_1;
	else if (distance(texture(TEXTURE,UV).rgb,SHIRT_2.rgb)<0.1) COLOR = Shirt_2;
	else if (distance(texture(TEXTURE,UV).rgb,PANT.rgb)<0.1) COLOR = Pant;
	else if (distance(texture(TEXTURE,UV).rgb,SOCKS_1.rgb)<0.1) COLOR = Socks_1;
	else if (distance(texture(TEXTURE,UV).rgb,SOCKS_2.rgb)<0.1) COLOR = Socks_2;
}
