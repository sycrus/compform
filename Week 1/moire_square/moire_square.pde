int n = 100;
float deg1 = 0f;
float deg2 = 0f;
float speed = 0.7f;
float stroke = 0.8f;


void setup() {
  size(800, 800);
}

void draw() { 
  background(0);
  stroke(255);
  strokeWeight(stroke);
 
  pushMatrix();
  translate(width/2, height/2);
  deg1 = deg1 + speed;
  rotate(radians(deg1));
  for (int i = -width/2; i < width/2; i += width/n) {
    line (i, -height/2, i, height/2);
  }
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  deg2 = deg2 - speed;
  rotate(radians(deg2));
  for (int i = -width/2; i < width/2; i += width/n) {
    line (i, -height/2, i, height/2);
  }
  popMatrix();
}
