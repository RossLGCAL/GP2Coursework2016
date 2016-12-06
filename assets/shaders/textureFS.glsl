#version 410

in vec4 vertexColoursOut;
in vec2 vertexTextureCoordsOut;
out vec4 FragColor;

uniform sampler2D diffuseSampler;

void main()
{
	FragColor = texture(diffuseSampler,vertexTextureCoordsOut)*vertexColoursOut;
}
