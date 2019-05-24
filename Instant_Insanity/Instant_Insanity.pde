Cube cube = new Cube(500, 500, 0);
void setup() {
  size(displayWidth, displayHeight, P3D); //Makes window that takes up the entire screen
}

void draw() {
  background(255);
  cube.drawNextFrame();
}

void keyPressed() {
  if(key == 'a') {
    cube.rotate(Direction.TURN_LEFT);
  }
  if(key == 's') {
    cube.rotate(Direction.TURN_DOWN);
  }
  if(key == 'd') {
    cube.rotate(Direction.TURN_RIGHT);
  }
  if(key == 'w') {
    cube.rotate(Direction.TURN_UP);
  }
}
