import org.processing.wiki.triangulate.*;
import megamu.mesh.*;

//20 points
ArrayList plist1 = new ArrayList();
ArrayList plist2 = new ArrayList();
ArrayList plist3 = new ArrayList();
ArrayList plist4 = new ArrayList();
ArrayList triangles1 = new ArrayList();
ArrayList triangles2 = new ArrayList();
ArrayList triangles3 = new ArrayList();
ArrayList triangles4 = new ArrayList();

void setup() {
   size(400, 400);
   
   colorMode(HSB, 100);
   //generate points within 180 by 180 area
   //brute force
   for (int i = 0; i < 20; i++) {
      plist1.add(new PVector(int(random(20, 180)), int(random(20, 180)))); 
      plist2.add(new PVector(200 + int(random(20, 180)), int(random(20, 180)))); 
      plist3.add(new PVector(int(random(20, 180)), 200 + int(random(20, 180)))); 
      plist4.add(new PVector(200 + int(random(20, 180)), 200 + int(random(20, 180)))); 
   }  
   triangles1 = Triangulate.triangulate(plist1);
   triangles2 = Triangulate.triangulate(plist2);
   triangles3 = Triangulate.triangulate(plist3);
   triangles4 = Triangulate.triangulate(plist4);
   
   //noLoop();
}

void draw() {
  
  noStroke();
  
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles1.size(); i++) {
    fill( 0, 100, int(random(100))); //red
    Triangle t = (Triangle)triangles1.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
  
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles2.size(); i++) {
    fill( 50, 100, int(random(100))); //cyan
    Triangle t = (Triangle)triangles2.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
  
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles3.size(); i++) {
    fill(  33, 100, int(random(100)));
    Triangle t = (Triangle)triangles3.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles4.size(); i++) {
    fill( 16, 100, int(random(100)));
    Triangle t = (Triangle)triangles4.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}
void keyPressed() { 
  if (key=='x') { 
    saveFrame("save-###.jpg");
    println("saved");
    
  }
}
