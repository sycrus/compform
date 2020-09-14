//reference: https://forum.processing.org/one/topic/how-to-make-perlin-noise-loop

int num = 256;
float rot = TWO_PI/num;
float innerRadZero, outerRad = 100;
float barrier = 0.95;
 
void setup() {
  size(700, 700);
  smooth();
}
 
void draw() {
  background(255);
  translate(width/2, height/2);
  fill(#ffcccc);
  //strokeWeight(0);
  noStroke();
  
  for (int i = 40; i > 0; i--) {
    fill(color(255-(i*5), 255 -(i*10)/2, (i*5)));
    drawBlob(20 + i*i, 2);
  }
  
}

void drawBlob(float d, float n) {
  beginShape();
  for (int i=0; i<num; i++) {
    float angle = i*rot;
    float x = cos(angle);
    float y = sin(angle);
    float innerRad = d + noise(i*0.025, frameCount*0.01*n) * 200;
    if (i == 0) {
      innerRadZero = innerRad;
    } else if (i>num*barrier) {
      float perc = map(i, num*barrier, num, 0, 1);
      innerRad = lerp(innerRad, innerRadZero, perc);
    }
    vertex(x*innerRad, y*innerRad);
    //vertex(x*outerRad, y*outerRad);
  }
  endShape(CLOSE);
}
