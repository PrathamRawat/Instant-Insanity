enum Orientation {
  FRONT_SIDE, BOTTOM_SIDE, RIGHT_SIDE, LEFT_SIDE, REAR_SIDE, TOP_SIDE
}

enum Colors {
  RED, BLUE, GREEN, YELLOW 
}

enum Direction {
  TURN_LEFT, TURN_RIGHT, TURN_UP, TURN_DOWN, NONE
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
    double xVelocity;
    double yVelocity;
    CubeState state;
    Direction turnDirection;
    float centerX;
    float centerY;
    float centerZ;
    float size;
    long timeStartTurning;
    final float ROT_TIME;
    
    Cube(float x, float y, float z, float size) {
      this.size = size;
      centerX = x;
      centerY = y;
      centerZ = z;
      faces = new Face[6];
      yAngle = (float)Math.PI / 4.0;
      xAngle = 0;
      xVelocity = 0;
      yVelocity = 0;
      targetXAngle = 0;
      targetYAngle = (float)Math.PI / 4;
      state = CubeState.DEFAULT;
      int counter = 0;
      for(Orientation faceSide: Orientation.values()) {
        Colors faceColor = Colors.values()[(int)random(4)];
        faces[counter] = new Face(faceSide, faceColor);
        counter++;
      }
      ROT_TIME = 5.0;
    }
    
    void drawNextFrame(){
      updateState();
      for(Face face: faces) {
        face.drawNextFrame();
      }
    }
    
    void updateState() {
      //println(state);
      switch(state) {
        case TURNING:
          updateVelocity();
          xAngle += xVelocity;
          yAngle += yVelocity;
          println(yVelocity);
          double curtime = (System.currentTimeMillis() - timeStartTurning) / 1000.0;
          //if(Math.abs(xAngle - targetXAngle) < 0.1 && Math.abs(yAngle - targetYAngle) < 0.1) {
          if(curtime >= ROT_TIME) {
            xAngle = targetXAngle;
            yAngle = targetYAngle;
            xVelocity = 0;
            yVelocity = 0;
            state = CubeState.DEFAULT;
            turnDirection = Direction.NONE;
          }
          break;
        case DEFAULT:
          break;
      }
    }
    
    void updateVelocity() {
      double curtime = (System.currentTimeMillis() - timeStartTurning) / 1000.0;
      //println("Time: " + curtime); 
      switch(turnDirection) {
        case TURN_UP:
          xVelocity = (Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime);
          break;
        case TURN_DOWN:
          xVelocity = -(Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime);
          break;
        case TURN_RIGHT:
          yVelocity = (Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime);
          break;
        case TURN_LEFT:
          yVelocity = -(Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime);
          break;
        case NONE:
          break;
      }
    }
      
    void rotate(Direction turnDirection) {
      if(state != CubeState.TURNING) {
        this.turnDirection = turnDirection;
        timeStartTurning = System.currentTimeMillis();
        state = CubeState.TURNING;
        switch(turnDirection) {
          case TURN_RIGHT:
            targetYAngle = yAngle - radians(90);
            break;
          case TURN_LEFT:
            targetYAngle = yAngle + radians(90);
            break;
          case TURN_UP:
            targetXAngle = xAngle - radians(90);
            break;
          case TURN_DOWN:
            targetXAngle = xAngle + radians(90);
            break;
          case NONE:
            break;
        }
      }
    }
    
    CubeState getState(){
      return state;
    }

  class Face {
    
    Face oppositeFace;
    color faceColor;
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
       this.face = face;
    }
    
    void drawFace() {
      fill(faceColor);
      beginShape();
      switch(face) {
        case FRONT_SIDE:
            vertex(-size, -size, -size);
            vertex(-size, size, -size);
            vertex(size, size, -size);
            vertex(size, -size, -size);
          break;
        case REAR_SIDE:
          vertex(-size, -size, size);
          vertex(-size, size, size);
          vertex(size, size, size);
          vertex(size, -size, size);
          break;
        case LEFT_SIDE:
          vertex(-size, -size, -size);
          vertex(-size, -size, size);
          vertex(-size, size, size);
          vertex(-size, size, -size);
          break;
        case RIGHT_SIDE:
          vertex(size, -size, -size);
          vertex(size, -size, size);
          vertex(size, size, size);
          vertex(size, size, -size);
          break;
        case TOP_SIDE:
          vertex(-size, -size, -size);
          vertex(-size, -size, size);
          vertex(size, -size, size);
          vertex(size, -size, -size);
          break;
        case BOTTOM_SIDE:
          vertex(size, size, -size);
          vertex(size, size, size);
          vertex(-size, size, size);
          vertex(-size, size, -size);
          break;
        default:
          throw new NullPointerException();
      }
      endShape();
    }
    
    void drawNextFrame() {
      pushMatrix();
      translate(centerX, centerY, centerZ);
      rotateY(yAngle);
      rotateX(xAngle);
      drawFace();
      popMatrix();
    }
    
  }
}