shader_type canvas_item;

uniform sampler2D textureHoles;
uniform sampler2D colorTexture;
uniform vec2 scrollDirection = vec2(0.01,0.01);
uniform float intensity :hint_range(0.0, 0.5, 0.01) = 0.1;

void fragment() {
	vec4 textureGaps = texture(textureHoles, UV);
	vec2 scroll = texture(TEXTURE, vec2(pow(UV.x -0.5,2),pow(UV.y -0.5,2)) + (scrollDirection * TIME)).br;
	vec4 color = texture(colorTexture, scroll);
	
	COLOR = vec4(color.rgb, 1.0);
	COLOR.a *= textureGaps.r;
	COLOR.a *= pow(UV.x - 0.5,2) + pow(UV.y - 0.5,2);
	if (COLOR.a <= 0.5 - intensity)
	{
		COLOR.a = 0.0;
	}
}
