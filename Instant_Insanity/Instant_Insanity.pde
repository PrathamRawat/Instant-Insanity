//Cube cube = new Cube(500, 500, 0);
Puzzle puzzle;

void setup() {
  size(displayWidth, displayHeight, P3D); //Makes window that takes up the entire screen
  puzzle = new Puzzle();
}

void draw() {
  background(0);
  noStroke();
  puzzle.updatePuzzleFrame();
  puzzle.displayPuzzleFrame();
  //cube.drawNextFrame();
}

void keyPressed() {
  if(key == 'a') {
    //cube.rotate(Direction.TURN_LEFT);
  }
  if(key == 's') {
    //cube.rotate(Direction.TURN_DOWN);
  }
  if(key == 'd') {
    //cube.rotate(Direction.TURN_RIGHT);
  }
  if(key == 'w') {
    //cube.rotate(Direction.TURN_UP);
  }
}
