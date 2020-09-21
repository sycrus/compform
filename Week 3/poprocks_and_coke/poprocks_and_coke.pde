import org.processing.wiki.triangulate.*;
import megamu.mesh.*;

int num = 15;
int rockPoints = 20;

ArrayList plist = new ArrayList(); //warm1
ArrayList plist2 = new ArrayList(); //warm2
ArrayList plist3 = new ArrayList(); //cool1
ArrayList plist4 = new ArrayList(); //cool2
ArrayList plist5 = new ArrayList(); //dark

color warm1 = #f7e0a3;
color warm2 = #f09c67;
color cool1 = #c8e6f5;
color cool2 = #5ca0d3;
color dark =  #142d4c;

void setup() {
  size(700, 700);
  smooth();
  for (int i = 0; i < 200; i++) { //warm1
    plist.add(new PVector((random(0, 700)), (random(0, 700))));
  }
  for (int i = 0; i < 150; i++) { //warm2
     plist2.add(new PVector((random(0, 700)), (random(0, 700)))); 
  }
  for (int i = 0; i < 100; i++) { //cool1
     plist3.add(new PVector((random(0, 700)), (random(0, 700)))); 
  }
  for (int i = 0; i < 50; i++) { //cool2
     plist4.add(new PVector((random(0, 700)), (random(0, 700)))); 
  }
  for (int i = 0; i < 10; i++) {
     plist5.add(new PVector((random(0, 700)), (random(0, 700)))); 
  }
  //loop();
  noLoop();
}

void draw() {
  background(255);
  noStroke();
  
  for (int i = 0; i < plist.size(); i++) {
    PVector pt = (PVector)(plist.get(i));
    drawChip(pt.x, pt.y, 5, warm1);
  }
  for (int i = 0; i < plist2.size(); i++) {
    PVector pt = (PVector)(plist2.get(i));
    drawChip(pt.x, pt.y, 10, warm2);
  }
  for (int i = 0; i < plist3.size(); i++) {
    PVector pt = (PVector)(plist3.get(i));
    drawChip(pt.x, pt.y, 5, cool1);
  }
  for (int i = 0; i < plist4.size(); i++) {
    PVector pt = (PVector)(plist4.get(i));
    drawChip(pt.x, pt.y, 15, cool2);
  }
  for (int i = 0; i < plist5.size(); i++) {
    PVector pt = (PVector)(plist5.get(i));
    drawChip(pt.x, pt.y, 25, dark);
  }
}

void drawChip (float x, float y, float range, color col) {
  ArrayList ptlist = new ArrayList();
  for (int i = 0; i < rockPoints; i++) {
    
    ptlist.add(new PVector(x + random(-range, range), y + random(-range, range)));
  }
  ArrayList triangles = Triangulate.triangulate(ptlist);
  
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    fill(col);
    noStroke();
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape(CLOSE);
}
