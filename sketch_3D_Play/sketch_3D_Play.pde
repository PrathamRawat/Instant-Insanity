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
  fill(255, 0, 0);
  vertex(-125, -125, -125);
  vertex(-125, 125, -125);
  vertex(125, 125, -125);
  vertex(125, -125, -125);
  endShape();
  
  beginShape();
  fill(0, 255, 0);
  vertex(-125, -125, -125);
  vertex(-125, -125, 125);
  vertex(125, -125, 125);
  vertex(125, -125, -125);
  endShape();
  
  beginShape();
  fill(0, 0, 255);
  vertex(125, -125, -125);
  vertex(125, -125, 125);
  vertex(125, 125, 125);
  vertex(125, 125, -125);
  endShape();
  
  beginShape();
  fill(0, 255, 255);
  vertex(125, 125, -125);
  vertex(125, 125, 125);
  vertex(-125, 125, 125);
  vertex(-125, 125, -125);
  endShape();
  
  beginShape();
  fill(255, 255, 0);
  vertex(-125, -125, -125);
  vertex(-125, -125, 125);
  vertex(-125, 125, 125);
  vertex(-125, 125, -125);
  endShape();
  
  beginShape();
  fill(255, 0, 255);
  vertex(-125, -125, 125);
  vertex(-125, 125, 125);
  vertex(125, 125, 125);
  vertex(125, -125, 125);
  endShape();
  
}
