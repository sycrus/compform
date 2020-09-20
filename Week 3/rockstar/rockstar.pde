import org.processing.wiki.triangulate.*;
import megamu.mesh.*;

//10 points
//float[][] points = new float[1000][2];
PFont spaceFont;
ArrayList plist = new ArrayList();
ArrayList plist2 = new ArrayList();
ArrayList plist3 = new ArrayList();
ArrayList plist4 = new ArrayList();
ArrayList triangles = new ArrayList();
ArrayList triangles2 = new ArrayList();
ArrayList triangles3 = new ArrayList();
ArrayList triangles4 = new ArrayList();

void setup() {
   size(820, 820);
   smooth(5);
  // String[] fontList = PFont.list();
  //printArray(fontList);
   spaceFont = createFont("SpaceMono-Regular", 15);
   textFont(spaceFont);
   
   //generate points within 400 by 400 area
   
}

void draw() {
  //using Delaunay
  //Delaunay myDelaunay = new Delaunay( points );
  //float[][] myEdges = myDelaunay.getEdges();
  
  //for(int i=0; i<myEdges.length; i++)
  //{
  //  float startX = myEdges[i][0];
  //  float startY = myEdges[i][1];
  //  float endX = myEdges[i][2];
  //  float endY = myEdges[i][3];
  //  line( startX, startY, endX, endY );
  //}
  //stroke(0);
  //strokeWeight(0.5);
  noFill();
  noStroke();
  
   for (int i = 0; i < 1000; i++) {
      plist.add(new PVector((random(0, 400)), (random(0, 400)))); 
   }  
   
    for (int i = 0; i < 1000; i++) {
      plist2.add(new PVector(min(random(0, 400), random(0, 400)), min(random(420, 820), random(420, 820)))); 
   }  
   
    for (int i = 0; i < 1000; i++) {
      plist3.add(new PVector(max(random(420, 820), random(420, 820)), max(random(0, 400), random(0, 400)))); 
   }  
   
    for (int i = 0; i < 1000; i++) {
      plist4.add(new PVector((random(420, 820)+random(420, 820)+random(420, 820)+ random(420, 820))/4, 
                              (random(420, 820)+ random(420, 820)+random(420, 820)+random(420, 820))/4 )); 
   }  
  
   triangles = Triangulate.triangulate(plist);
   triangles2 = Triangulate.triangulate(plist2);
   triangles3 = Triangulate.triangulate(plist3);
   triangles4 = Triangulate.triangulate(plist4);

  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    fill( map(triArea(t.p1, t.p2, t.p3), 0, 250, 0, 255));
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
  pushStyle();
    fill(0);
    noStroke();
    text("Unweighted", 5, 412);
  popStyle();
  
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles2.size(); i++) {
    
    Triangle t = (Triangle)triangles2.get(i);
    fill( map(triArea(t.p1, t.p2, t.p3), 0, 200, 0, 255));
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
  pushStyle();
    fill(0);
    noStroke();
    text("Low Bias", 5, 812);
  popStyle();
  
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles3.size(); i++) {
    Triangle t = (Triangle)triangles3.get(i);
    fill( map(triArea(t.p1, t.p2, t.p3), 0, 200, 0, 255));
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
  pushStyle();
    fill(0);
    noStroke();
    text("High Bias", 417, 412);
  popStyle();
  
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles4.size(); i++) {
    Triangle t = (Triangle)triangles4.get(i);
    fill( map(triArea(t.p1, t.p2, t.p3), 0, 200, 0, 255));
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
  pushStyle();
    fill(0);
    noStroke();
    text("Middle Bias", 417, 812);
  popStyle();
  
  plist.clear();
  plist2.clear();
  plist3.clear();
  plist4.clear();
  
}

float triArea(PVector p1, PVector p2, PVector p3) {
  float areaSigned = (p1.x * (p2.y - p3.y) + p2.x * (p3.y - p1.y) + p3.x * ( p1.y - p2.y) ) / 3;
  return abs(areaSigned);
}
