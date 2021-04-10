uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform mat4 texMatrix;

uniform vec4 lightPosition;

uniform float camx;
uniform float camy;
uniform float camz;

uniform float lx;
uniform float ly;
uniform float lz;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

varying vec4 vertTexCoord;
varying float fogdist;

float dist(vec3 p1, vec3 p2){
  return sqrt(pow(p1.x-p2.x,2)+pow(p1.y-p2.y,2)+pow(p1.z-p2.z,2));
}

void main() {
  gl_Position = transform * position;
  vec3 ecPosition = vec3(modelview * position);
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
  fogdist = dist(vec3(20,20,0),position.xyz);
}