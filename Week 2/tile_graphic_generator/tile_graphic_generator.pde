color a = #e5e5e5; 
color b = #2d4059; 
color c = #ea5455; 
color d = #decdc3; 

void setup() {
  size(600, 800);
  background(255);
  //each tile is 100 x 100
  //noLoop();
}
void draw() {
  for (int x = 0 ; x < width; x +=100) {
    for (int y = 0 ; y < height; y +=100) {
      randomTile(x, y);
    }
  }
}

void randomTile(int x, int y) {
  noStroke();
  int num1 = int(random(3));
  int num2 = int(random(3));
  int num3 = int(random(3));
  int rot = int(random(4));
  int col=  int(random(3));
  
  switch(col) {
  case 0: 
    fill(b);
    break;
  case 1: 
    fill(c);
    break;
  case 2: 
    fill(d);
    break;
  default:
    fill(a);
    break;
  }   
  
  switch(num3) {
  case 0: 
    rect(x, y, 100, 100); //full
    break;
  case 1: 
    pushMatrix();
    translate(x,y);
    if (rot % 2 == 0) {
      rotate(radians(90));
    }
    rect(0, 0, 100, 50); //half
    popMatrix();
    break;
  case 2: 
    pushMatrix();
    translate(x,y);
    if (rot % 2 == 0) {
      rotate(radians(90));
    }
    triangle(0, 0, 100, 0, 0, 100);
    popMatrix();
    
    break;
  }
  
  col = int(random(3));
  switch(col) {
  case 0: 
    fill(b);
    break;
  case 1: 
    fill(c);
    break;
  case 2: 
    fill(d);
    break;
  default:
    fill(a);
    break;
  }   
  
  //layer 2
  rot = int(random(4));
  switch(num2) {
  case 0: 
    circle(x + 50, y + 50, 100);
    break;
  case 1:
  pushMatrix();
    translate(x,y);
    if (rot % 2 == 0) {
      rotate(radians(90));
    }
    triangle(0, 0, 100,0, 50, 100);
    popMatrix();
    
    break;
  case 2: 
    pushMatrix();
    translate(x,y);
    if (rot % 2 == 0) {
      rotate(radians(90));
    }
    triangle(0, 0, 100, 0, 50, 50);
    triangle(0, 100, 100, 100, 50, 50);
    popMatrix();
    break;
  }
  
  col = int(random(3));
  switch(col) {
  case 0: 
    fill(b);
    break;
  case 1: 
    fill(c);
    break;
  case 2: 
    fill(d);
    break;
  default:
    fill(a);
    break;
  }   
  //layer 1
  switch(num1) {
  case 0: 
    circle(x + 50, y + 50, 30);
    break;
  case 1: 
    rect(x+25, y+25, 50, 50);
    break;
  case 2: 
    pushMatrix();
      translate(x+50, y+17);
      rotate(radians(45));
      rect(0, 0 , 50, 50);
      popMatrix();
    break;
  }
}
void keyPressed() { 
  if (key=='x') { 
    saveFrame("save-###.jpg");
    println("saved");
    
  }
}
