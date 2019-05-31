//Cube cube = new Cube(500, 500, 0);
Puzzle puzzle;

void setup() {
  size(displayWidth, displayHeight, P3D); //Makes window that takes up the entire screen
  puzzle = new Puzzle();
}

void draw() {
  background(0);
  //noStroke();
  puzzle.updatePuzzleFrame();
  puzzle.displayPuzzleFrame();
  //cube.drawNextFrame();
}

void keyPressed() {
  if(key == 'j') {
    puzzle.moveSelectorUp();
  }
  if(key == 'k') {
    puzzle.moveSelectorDown();
  }
  if(key == 'a') {
    puzzle.turnLeft();
  }
  if(key == 'w') {
    puzzle.turnUp();
  }
  if(key == 's') {
    puzzle.turnDown();
  }
  if(key == 'd') {
    puzzle.turnRight();
  }
}
