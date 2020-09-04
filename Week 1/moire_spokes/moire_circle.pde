
float randomY = 0;
float speed = 0.2f;
float deg1 = 0;
float deg2 = 0;
float stroke = 2;

void setup()
{ 
  size( 800, 800 ); 
  // Initialize all values
  background( 0 );

  noFill();
  strokeWeight(stroke);
  
}

void draw() {
  background(255);
  stroke( #ff0000, 200);
  pushMatrix();
  translate(width/2 + 50, height/2);
  deg1 += speed;
  rotate(radians(deg1));
  for ( int t = 0; t < 360; t = t + 2 ) { //for rotation
    pushMatrix();
    rotate(radians(t));
    line(0, 0, 0, 400);
    popMatrix();
  }
  popMatrix();

  stroke(#0000ff, 200 );
  pushMatrix();
  translate(width/2-50, height/2);
  deg2 -=speed;
  rotate(radians(deg2));
  for ( int t = 0; t < 360; t = t + 2 ) { //for rotation
    pushMatrix();
    rotate(radians(t));
    line(0, 0, 0, 400);
    popMatrix();
  }

  popMatrix();
}


void keyPressed() { 
  if (key=='x') { 
    saveFrame("save-###.jpg");
    println("saved");
  }
}
