enum Orientation {
  FRONT_SIDE, BOTTOM_SIDE, RIGHT_SIDE, LEFT_SIDE, REAR_SIDE, TOP_SIDE
}

enum Colors {
  RED, BLUE, GREEN, YELLOW 
}

enum Direction {
  TURN_LEFT, TURN_RIGHT, TURN_UP, TURN_DOWN  
}

enum CubeState {
  DEFAULT, TURNING  
}

class Cube {
    Face[] faces;
    float xAngle;
    float yAngle;
    float targetXAngle;
    float targetYAngle;
    float xVelocity;
    float yVelocity;
    CubeState state;
    float centerX;
    float centerY;
    float centerZ;
    
    public Cube(float x, float y, float z){
      centerX = x;
      centerY = y;
      centerZ = z;
      faces = new Face[6];
      xAngle = 0;
      yAngle = 0;
      xVelocity = 0;
      yVelocity = 0;
      state = CubeState.DEFAULT;
      int counter = 0;
      for(Orientation faceSide: Orientation.values()) {
        faces[counter] = new Face(faceSide, Colors.RED);
        counter++;
      }
    }
    
    void drawNextFrame(){
      updateState();
      for(Face face: faces) {
        face.drawNextFrame();
      }
    }
    
    void updateState() {
      println(state);
      switch(state) {
        case TURNING:
          updateVelocity();
          xAngle += xVelocity;
          yAngle += yVelocity;
          if(Math.abs(xAngle - targetXAngle) < 0.1 || Math.abs(yAngle - targetYAngle) < 0.1) {
            xAngle = targetXAngle;
            yAngle = targetYAngle;
            xVelocity = 0;
            yVelocity = 0;
            state = CubeState.DEFAULT;
          }
          break;
        case DEFAULT:
          break;
      }
    }
    
    void updateVelocity() {
      //Sam's magic
    }
    
    void rotate(Direction turnDirection) {
      state = CubeState.TURNING;
      switch(turnDirection) {
        case TURN_UP:
          targetYAngle = yAngle + radians(90);
          yVelocity = 0.5;
          break;
        case TURN_DOWN:
          targetYAngle = yAngle - radians(90);
          yVelocity = -0.5;
          break;
        case TURN_RIGHT:
          targetXAngle = xAngle + radians(90);
          xVelocity = 0.5;
          break;
        case TURN_LEFT:
          targetXAngle = xAngle - radians(90);
          xVelocity = -0.5;
          break;
      }
    }
    
    CubeState getState(){
      return state;
    }

  class Face {
    
    Face oppositeFace;
    color faceColor;
    float angle;
    Orientation face;
    
    public Face(Orientation face, Colors faceColor) {
       switch(faceColor) {
         case RED:
           this.faceColor = color(255, 0, 0);
           break;
         case BLUE:
           this.faceColor = color(0, 0, 255);
           break;
         case GREEN:
           this.faceColor = color(0, 255, 0);
           break;
         case YELLOW:
           this.faceColor = color(255, 0, 255);
           break;
       }
       angle = 0;
       this.face = face;
    }
    
    void drawFace() {
      translate(centerX, centerY, centerZ);
      fill(faceColor);
      beginShape();
      switch(face) {
        case FRONT_SIDE:
            vertex(-125, -125, -125);
            vertex(-125, 125, -125);
            vertex(125, 125, -125);
            vertex(125, -125, -125);
          break;
        case REAR_SIDE:
          vertex(-125, -125, 125);
          vertex(-125, 125, 125);
          vertex(125, 125, 125);
          vertex(125, -125, 125);
          break;
        case LEFT_SIDE:
          vertex(-125, -125, -125);
          vertex(-125, -125, 125);
          vertex(-125, 125, 125);
          vertex(-125, 125, -125);
          break;
        case RIGHT_SIDE:
          vertex(125, -125, -125);
          vertex(125, -125, 125);
          vertex(125, 125, 125);
          vertex(125, 125, -125);
          break;
        case TOP_SIDE:
          vertex(-125, -125, -125);
          vertex(-125, -125, 125);
          vertex(125, -125, 125);
          vertex(125, -125, -125);
          break;
        case BOTTOM_SIDE:
          vertex(125, 125, -125);
          vertex(125, 125, 125);
          vertex(-125, 125, 125);
          vertex(-125, 125, -125);
          break;
        default:
          throw new NullPointerException();
      }
      endShape();
    }
    
    void drawNextFrame() {
      pushMatrix();
      rotateX(xAngle);
      rotateY(yAngle);
      drawFace();
      popMatrix();
    }
    
  }
}
