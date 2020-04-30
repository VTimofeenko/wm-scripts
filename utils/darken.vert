#version 120
# Basically blur1.vert from https://github.com/naelstrof/slop with one value changed

attribute vec2 position;
attribute vec2 uv;

varying vec2 uvCoord;

void main()
{
	uvCoord = uv;
	gl_Position = vec4(position,0,1);
}
