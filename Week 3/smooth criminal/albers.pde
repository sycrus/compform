//setup size of grid
Circles[][] circArray;
int keyCount = 0;
String keyString ;
int nodeCount = 1;

int startX, startY;
int currI, currJ; //current row and col coords
int modI, modJ; //mods to curr position for neighbors
int newI, newJ; //new row and col coords

int numCols = 11;
int numRows = 11;
int xSpacing = 60;
int ySpacing = 60;
int saveCount = 0;

boolean isNeighborFound = false;
boolean isDone = false;

void setup() {
  size(720, 720);
  background(#dfd9ba);

  circArray = new Circles[numCols][numRows];
  setupArray();

  strokeJoin(MITER);
  strokeCap(PROJECT);

  //printCircles();

  //picks random starting point
  startX = int(random(1, numCols-1));
  startY = int(random(1, numRows-1));
  
  currI = startX; 
  currJ = startY;
}

void draw() {
  // restart when complete
  if (hasNeighbors(currI, currJ) == false) {
    println("NodeCount =", nodeCount);
    if (nodeCount > 50) {
      saveFrame("save-####.jpg");
      println("saved");
    }
    nodeCount = 0;
    setup();
  } 

  pickNeighbor(currI, currJ);
  drawConnection(currI, currJ, newI, newJ);
  increaseNeighbors(currI, currJ, newI, newJ);
  nodeCount++;

  //shift pointer
  currI = newI; 
  currJ = newJ;
  delay(100);

}

//draws a line from old point to new point
void drawConnection(int oldI, int oldJ, int newI, int newJ) {
  strokeWeight(30);
  stroke(#e8c00d);
  line((circArray[oldI][oldJ]._x + 1) * xSpacing, (circArray[oldI][oldJ]._y + 1) * ySpacing, 
    (circArray[newI][newJ]._x + 1) * xSpacing, (circArray[newI][newJ]._y + 1) * ySpacing);
}

//increase number of neighbors for both old and new points
void increaseNeighbors(int oldI, int oldJ, int newI, int newJ) {
  circArray[oldI][oldJ]._n = circArray[oldI][oldJ]._n + 1 ;
  circArray[newI][newJ]._n = circArray[newI][newJ]._n + 1 ;
}


// checks if point (i, j) has any neighbors
boolean hasNeighbors (int i, int j) {
  //neighbors of point [i][j] are
  //               [i][j-1]
  // [i-1][j],     [i][j],   [i+1][j]
  //               [i][j+1]

  if (circArray[i][j-1]._n < 2 ) { //
    return true; //exits once true
  }
  if (circArray[i+1][j]._n < 2 ) { //
    return true; //exits once true
  }
  if (circArray[i-1][j]._n < 2 ) { //
    return true; //exits once true
  }
  if (circArray[i][j+1]._n < 2 ) { //
    return true; //exits once true
  }  
  return false;
}

// picks a neighbor of point (i, j)
void pickNeighbor(int i, int j) {
  isNeighborFound = false;

  while (!isNeighborFound) {

    findNeighborMods(); //randomly picks a neighbor
    newI = i + modI;
    newJ = j + modJ;

    //checks for if neighbor picked is eligible
    //neighbors with vacancies: n < 2
    //neighbors without vacacies: n == 2
    if (circArray[newI][newJ]._n < 2) { 
      isNeighborFound = true;
    } else { //circArray[newI][newJ]._n >=2
      isNeighborFound = false;
    }
  }
}

//generate a random pair of mods to the initial coords
void findNeighborMods() {
  //get current point [i][j]
   //neighbors of point [i][j] are
  //               [i][j-1]
  // [i-1][j],     [i][j],   [i+1][j]
  //               [i][j+1]
  
  //mods either I or J value
  int rollDie = int(random(100)) % 4 ;
  if (rollDie == 0) {
    modI = 1 ; 
    modJ = 0;
  } 
  if (rollDie == 1) {
    modI = -1 ; 
    modJ = 0;
  }
  if (rollDie == 2) {
    modI = 0 ; 
    modJ = 1;
  }
  if (rollDie == 3) {
    modI = 0 ; 
    modJ = -1;
  }
}

//sets up array of possible points
void setupArray() {
  for (int j = 0; j < circArray[0].length; j++) {
    for (int i = 0; i < circArray.length; i++) {

      if ( (i > 0) && (i < circArray.length-1)) {
        if ( (j > 0) && (j < circArray[0].length-1)) {
          circArray[i][j] = new Circles(i, j, '1', 0);
          keyCount++;
        } else {
          circArray[i][j] = new Circles(i, j, 'x', 2);
        }
      } else {
        circArray[i][j] = new Circles(i, j, 'x', 2);
      }
    }
  }
}

//prints the grid
void printCircles() {
  fill(0);
  noStroke();
  for (int i = 0; i < circArray.length; i++) {
    for (int j = 0; j < circArray[0].length; j++) {

      if ( (i > 0) && (i < circArray.length-1)) {
        if ( (j > 0) && (j < circArray[0].length-1)) {
          circle((i + 1)*xSpacing, (j+1)*ySpacing, 1);
        }
      }
    }
  }
}

void keyPressed() { 
  if (key=='x') { 
    saveFrame("save-###.jpg");
    println("saved");
  }
}
