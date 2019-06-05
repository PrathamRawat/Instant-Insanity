//Cube cube = new Cube(500, 500, 0);
Puzzle puzzle;

void setup() {
  size(displayWidth, displayHeight, P3D); //Makes window that takes up the entire screen
  puzzle = new Puzzle();
}

void draw() {
  background(180);
  //noStroke();
  puzzle.updatePuzzleFrame();
  puzzle.displayPuzzleFrame();
  //cube.drawNextFrame();
  if(puzzle.isSolved()) {
    fill(0);
    PFont f = createFont("Arial",16,true);
    textFont(f, 24);
    text("Solved!", displayWidth / 2, displayHeight / 3);  
  }
}

void keyPressed() {
  if(key == 'j') {
    puzzle.moveSelectorLeft();
  }
  if(key == 'l') {
    puzzle.moveSelectorRight();
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
  if(key == 'i') {
    puzzle.turnAllUp();
  }
  if(key == 'k') {
    puzzle.turnAllDown();
  }
  if(key == 't') {
    puzzle.scramble();
  }
  if(key == ' ') {
    puzzle.solve();  
  }
}
