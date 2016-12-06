#ifndef VERTEX_H
#define VERTEX_H

#include "Common.h"

struct Vertex {
	vec3 position;
	vec4 colours;
	vec2 texCoords0;
	vec3 normal;
	vec3 tangent;
	vec3 binormal;
};

#endif
