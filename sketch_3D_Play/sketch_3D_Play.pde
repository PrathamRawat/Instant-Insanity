void setup() {
  size(1000, 800, P3D);
  rotationX = 0.0;
  rotationY = 0.0;
}

float rotationX;
float rotationY;

void draw() {
  //background(255);
  //translate(250, 250, 0);
  //noFill();
  //rotateX(rotationX);
  //rotateY(rotationY);
  //rotationX += 0.05;
  //rotationY += 0.10;
  //box(250); 
  drawColors();
}

void drawColors() {
  background(255);
  
  translate(500, 400, 125);
  rotateX(rotationX);
  rotateY(rotationY);
  rotationX += 0.05;
  rotationY += 0.10;
  
  beginShape();
  color red = color(255, 0, 0);
  fill(red);
  vertex(-125, -125, -125);
  vertex(-125, 125, -125);
  vertex(125, 125, -125);
  vertex(125, -125, -125);
  endShape();
  
  beginShape();
  color green = color(0,255,0);
  fill(green);
  vertex(-125, -125, -125);
  vertex(-125, -125, 125);
  vertex(125, -125, 125);
  vertex(125, -125, -125);
  endShape();
  
  beginShape();
  color blue = color(0,0,255);
  fill(blue);
  vertex(125, -125, -125);
  vertex(125, -125, 125);
  vertex(125, 125, 125);
  vertex(125, 125, -125);
  endShape();
  
  beginShape();
  color cyan = color(0,255,255);
  fill(cyan);
  vertex(125, 125, -125);
  vertex(125, 125, 125);
  vertex(-125, 125, 125);
  vertex(-125, 125, -125);
  endShape();
  
  beginShape();
  color yellow = color(255,255,0);
  fill(yellow);
  vertex(-125, -125, -125);
  vertex(-125, -125, 125);
  vertex(-125, 125, 125);
  vertex(-125, 125, -125);
  endShape();
  
  beginShape();
  color magenta = color(255,0,255);
  fill(magenta);
  vertex(-125, -125, 125);
  vertex(-125, 125, 125);
  vertex(125, 125, 125);
  vertex(125, -125, 125);
  endShape();
  
}