//reference https://processing.org/examples/noisewave.html

color a = #f4f6ff; //light violet
color b = #ffcb74; //ochre
color c = #ea907a; //salmon
color d = #4f8a8b; //green

float yoff = 0.0;        // 2nd dimension of perlin noise

void setup() {
  size(400, 566);
  noStroke();
  //noLoop();
}

void draw() {
  background(a);
  
  
  
  //fill(a); //light violet
  //slopeGen(-0.6, 300, 500);
  translate(0, 100);
  fill(b); //ochre
  slopeGen(random(-0.8, 0.8), int(random(200, 500)));
  
  
  translate(0, 100);
  fill(d); //green
  slopeGen(random(-0.8, 0.8), int(random(200, 500)));
  
  translate(0, 100);
  fill(c); //salmon
  slopeGen(random(-0.8, 0.8), int(random(200, 500)));
}

void slopeGen(float n, int ranS) {
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  //change y start point
  //float y_start = random(ranS, ranE);
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    noiseDetail(5,0.6);
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
    
    // Set the vertex
    vertex(x, y + x*n - ranS); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void keyPressed() { 
  if (key=='x') { 
    saveFrame("save-###.jpg");
    println("saved");
    
  }
}
