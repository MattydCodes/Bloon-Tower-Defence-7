#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

precision mediump float;
precision mediump int;

uniform sampler2D texture;
uniform float skyr;
uniform float skyg;
uniform float skyb;

varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;
varying float fogdist;

void main() {
  ivec2 textureSize = textureSize(texture,0);

  vec4 texel = texelFetch(texture, ivec2(int(vertTexCoord.s*textureSize.x),int(vertTexCoord.t*textureSize.y)), 0);
  float a = max(min((fogdist-23.2)/25.0f,1f),0f);
  a*=a*a;


  gl_FragColor = (texel) * (1f-a) + vec4(skyr,skyg,skyb,texel.a) * a;
}