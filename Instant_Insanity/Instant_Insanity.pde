void setup() {
  size(displayWidth, displayHeight, P3D); //Makes window that takes up the entire screen
}

void draw() {
  background(255);
  Cube cube = new Cube(mouseX, mouseY, 0);
  cube.drawNextFrame();
}
