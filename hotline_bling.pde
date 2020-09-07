char[] keys = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'};
Circles[][] circArray = new Circles[5][6];
int keyCount = 0;
String keyString ;
int nodeCount = 1;

int currI, currJ; //current row and col coords
int modI, modJ; //mods to curr position for neighbors
int newI, newJ; //new row and col coords

int numCols = 5;
int numRows = 6;
boolean isNeighborFound = false;
boolean isDone = false;

void setup() {
  size(600, 600);
  background(255);
  setupKeyArray();
  fill(0);
  //printCircles();

  //int randX = int(random(1, numCols-1));
  //int randY = int(random(1, numRows-1));
  int randX = 2; 
  int randY = 4; //#
  currI = randX; 
  currJ = randY;


  loop();
}

void draw() {
  fill(0);

  pickNeighbor(currI, currJ);
  drawConnection(currI, currJ, newI, newJ);
  nodeCount++;
  currI = newI; 
  currJ = newJ;
}

void drawConnection(int oi, int oj, int ni, int nj) {
  strokeWeight(8);

  line(100 + circArray[oi][oj]._x * 50, 100 + circArray[oi][oj]._y * 50, 
    100 + circArray[ni][nj]._x * 50, 100 + circArray[ni][nj]._y * 50);

  circArray[oi][oj]._n = circArray[oi][oj]._n + 1 ;
  circArray[ni][nj]._n = circArray[ni][nj]._n + 1 ;
}

boolean hasNeighbors (int i, int j) {
  boolean isValid = false;
  for (int x = -1; x < 2; x++) {
    for (int y = -1; y < 2; y++) {
      if (circArray[i + x][j + y]._n < 2) {
        isValid= true;
      }
    }
  }
  if (isValid) { 
    return true;
  } else { 
    return false;
  }
}
void pickNeighbor(int i, int j) {
  isNeighborFound = false;
  while (!isNeighborFound) {
    findNeighborMods();
    if (modI == 0 && modJ == 0) {
      
      isNeighborFound = false;
    } else {
      newI = i + modI;
      newJ = j + modJ;

      if (circArray[newI][newJ]._n < 2) {
        isNeighborFound = true;
      } else { //circArray[newI][newJ]._n >=2
        isNeighborFound = false;
      }
    }
  }
}
void findNeighborMods() {
  //get current point [i][j]
  //neighbors of point [i][j] are
  // [i-1][j-1],   [i][j-1], [i+1][j-1]
  // [i-1][j],     [i][j],   [i+1][j]
  // [i-1][j+1],   [i][j+1], [i+1][j+1]
  
  //generate a random pair of mods to the initial coords
  modI = int(random(100)) % 3 -1 ;
  modJ = int(random(100)) % 3 -1 ;
}

void setupKeyArray() {
  for (int j = 0; j < circArray[0].length; j++) {
    for (int i = 0; i < circArray.length; i++) {

      if ( (i > 0) && (i < circArray.length-1)) {
        if ( (j > 0) && (j < circArray[0].length-1)) {
          circArray[i][j] = new Circles(i, j, keys[keyCount], 0);
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

void printCircles() {
  for (int i = 0; i < circArray.length; i++) {
    for (int j = 0; j < circArray[0].length; j++) {

      if ( (i > 0) && (i < circArray.length-1)) {
        if ( (j > 0) && (j < circArray[0].length-1)) {
          circle( 100 + i*50, 100 + j*50, 15);
        }
      }
    }
  }
}

void checkValues() {
  //print("Original:", randX, randY, " Key:", circArray[randX][randY]._key, 
  //        " Mod: ", modI, modJ, 
  //        " Neighbor: ", newI, newJ, "Key: ", circArray[newI][newJ]._key, "\n");
}
