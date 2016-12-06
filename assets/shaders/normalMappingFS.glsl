#version 410

out vec4 FragColor;

in vec3 vertexNormalOut;
in vec3 cameraDirectionOut;
in vec2 vertexTextureCoordsOut;
in vec3 lightDirectionOut;

uniform sampler2D diffuseSampler;
uniform sampler2D specularSampler; 
uniform sampler2D normalSampler;

uniform vec4 ambientMaterialColour=vec4(0.5f,0.0f,0.0f,1.0f);
uniform vec4 diffuseMaterialColour=vec4(0.8f,0.0f,0.0f,1.0f);
uniform vec4 specularMaterialColour=vec4(1.0f,1.0f,1.0f,1.0f);
uniform float specularPower=25.0f;



struct DirectionalLight 
{
 vec3 Direction;
 vec4 ambientLightColour;
 vec4 diffuseLightColour;
 vec4 specularLightColour;
};
uniform DirectionalLight directionLight;

void main()
{
    vec3 bumpNormals = texture(normalSampler,vertexTextureCoordsOut).xyz;
	bumpNormals = normalize(bumpNormals * 2.0f - 1.0f);

	vec3 lightDir=normalize(-directionLight.Direction);
	float diffuseTerm = dot(bumpNormals, lightDir);
	vec3 halfWayVec = normalize(cameraDirectionOut + lightDir);
	float specularTerm = pow(dot(bumpNormals, halfWayVec), specularPower);
	
	vec4 specularTextureColour = texture(specularSampler, vertexTextureCoordsOut);
	vec4 diffuseTextureColour = texture(diffuseSampler, vertexTextureCoordsOut);
	FragColor = (ambientMaterialColour*directionLight.ambientLightColour) + (diffuseTextureColour*directionLight.diffuseLightColour*diffuseTerm) + (specularTextureColour*directionLight.specularLightColour*specularTerm);
	//FragColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
	}
