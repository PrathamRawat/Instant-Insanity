void setup() {
  size(displayWidth, displayHeight, P3D); //Makes window that takes up the entire screen
}

void draw() {
  Cube cube = new Cube(mouseX, mouseY, 0);
}
