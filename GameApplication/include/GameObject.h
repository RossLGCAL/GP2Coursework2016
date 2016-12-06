#ifndef GAMEOBJECT_H
#define GAMEOBJECT_H

#include "Common.h"
#include "Vertex.h"
#include "Texture.h"
#include "Shader.h"

class GameObject
{
public:
	GameObject();
	~GameObject();

	void onUpdate();
	void onRender(mat4& view, mat4& projection);
	void onInit();
	void onDestroy();

	void addChild(shared_ptr<GameObject> gameobject);

	mat4& getModelMatrix()
	{
		return m_ModelMatrix;
	}

	void setPosition(const vec3& pos)
	{
		m_Position = pos;
	};

	void setRotation(const vec3& rot)
	{
		m_Rotation = rot;
	};

	void setScale(const vec3& scale)
	{
		m_Scale = scale;
	};

	vec3& getPosition()
	{
		return m_Position;
	};

	vec3& getRotation()
	{
		return m_Rotation;
	};

	vec3& getScale()
	{
		return m_Scale;
	};

	void rotate(const vec3& delta);

	void loadDiffuseTexture(const string& filename);
	void loadSpecularTexture(const string& filename);
	void loadNormaltexture(const string& filename);
	void loadShaders(const string& vsFilename, const string& fsFilename);
	void copyVertexData(Vertex *pVertex, int numberOfVertices, int *pIndices, int numberOfIndices);

	GLuint getShaderProgram()
	{
		return m_ShaderProgram;
	};

	void setAmbientMaterialColour(const vec4& colour)
	{
		m_AmbientMaterialColour = colour;
	};

	void setDiffuseMaterialColour(const vec4& colour)
	{
		m_DiffuseMaterialColour = colour;
	};

	void setSpecularMaterialColour(const vec4& colour)
	{
		m_SpecularMaterialColour = colour;
	};

	void setSpecularPower(float power)
	{
		m_SpecularMaterialPower = power;
	};
private:
	GameObject * m_pParent;
	vector<shared_ptr<GameObject> > m_ChildrenGameObjects;

	vec3 m_Position;
	vec3 m_Rotation;
	vec3 m_Scale;
	vec3 m_Position1;
	vec3 m_Rotation1;
	vec3 m_Scale1;

	mat4 m_TranslationMatrix;
	mat4 m_ScaleMatrix;
	mat4 m_RotationMatrix;
	mat4 m_ModelMatrix;

	mat4 m_TranslationMatrix1;
	mat4 m_ScaleMatrix1;
	mat4 m_RotationMatrix1;
	mat4 m_ModelMatrix1;

	GLuint m_VBO;
	GLuint m_EBO;
	GLuint m_VAO;
	int m_NumberOfVerts;
	int m_NumberOfIndices;

	//Shader Program
	GLuint m_ShaderProgram;
	GLuint m_DiffuseTexture;
	GLuint m_SpecularTexture;
	GLuint m_NormalTexture;
	GLuint m_diffuseSampler;
	GLuint m_specularSampler;

	//Materials
	vec4 m_AmbientMaterialColour;
	vec4 m_DiffuseMaterialColour;
	vec4 m_SpecularMaterialColour;
	float m_SpecularMaterialPower;
};

#endif
