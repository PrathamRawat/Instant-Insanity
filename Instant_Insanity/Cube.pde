enum Orientation {
  //FRONT_SIDE, BOTTOM_SIDE, RIGHT_SIDE, LEFT_SIDE, REAR_SIDE, TOP_SIDE
  TOP_SIDE, LEFT_SIDE, FRONT_SIDE, RIGHT_SIDE, BOTTOM_SIDE, REAR_SIDE
}

enum Colors {
  RED, BLUE, GREEN, MAGENTA 
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
    boolean isSelected;
    
    Cube(float x, float y, float z, float size) {
      this.size = size;
      centerX = x;
      centerY = y;
      centerZ = z;
      faces = new Face[6];
      yAngle = 0;
      xAngle = (float)Math.PI / 4.0;
      xVelocity = 0;
      yVelocity = 0;
      targetXAngle = 0;
      targetYAngle = (float)Math.PI / 4;
      state = CubeState.DEFAULT;
      int counter = 0;
      for(Orientation faceSide: Orientation.values()) {
        Colors faceColor = Colors.values()[(int)random(4)];
        faces[counter] = new Face(faceSide, faceColor, this);
        counter++;
      }
      ROT_TIME = 0.25;
      isSelected = false;
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
          double curtime = (System.currentTimeMillis() - timeStartTurning) / 1000.0;
          //if(Math.abs(xAngle - targetXAngle) < 0.1 && Math.abs(yAngle - targetYAngle) < 0.1) {
          if(curtime >= ROT_TIME) {
            xAngle = targetXAngle;
            yAngle = targetYAngle;
            xVelocity = 0;
            yVelocity = 0;
            state = CubeState.DEFAULT;
            updateArray(turnDirection);
            turnDirection = Direction.NONE;
          }
          break;
        case DEFAULT:
          break;
      }
    }
    
    void select(){
      isSelected = ! isSelected;
    }
    
    void updateVelocity() {
      double curtime = (System.currentTimeMillis() - timeStartTurning) / 1000.0;
      //println("Time: " + curtime); 
      switch(turnDirection) {
        case TURN_UP:
          xVelocity = (Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime) / 120;
          break;
        case TURN_DOWN:
          xVelocity = -(Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime) / 120;
          break;
        case TURN_RIGHT:
          yVelocity = (Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime) / 120;
          break;
        case TURN_LEFT:
          yVelocity = -(Math.PI / 2) * (6 / Math.pow(ROT_TIME,3)) * curtime * (ROT_TIME - curtime) / 120;
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
            targetYAngle = yAngle + radians(90);
            break;
          case TURN_LEFT:
            targetYAngle = yAngle - radians(90);
            break;
          case TURN_UP:
            targetXAngle = xAngle + radians(90);
            break;
          case TURN_DOWN:
            targetXAngle = xAngle - radians(90);
            break;
          case NONE:
            break;
        }
      }
    }
    
    void updateArray(Direction turnDirection) {
      Face temp;
      switch(turnDirection) {
          case TURN_LEFT:
            temp = faces[0];
            faces[0] = faces[3];
            faces[3] = faces[4];
            faces[4] = faces[1];
            faces[1] = temp;
            break;
          case TURN_RIGHT:
            temp = faces[0];
            faces[0] = faces[1];
            faces[1] = faces[4];
            faces[4] = faces[3];
            faces[3] = temp;
            break;
          case TURN_DOWN:
            temp = faces[0];
            faces[0] = faces[5];
            faces[5] = faces[4];
            faces[4] = faces[2];
            faces[2] = temp;
            break;
          case TURN_UP:
            temp = faces[0];
            faces[0] = faces[2];
            faces[2] = faces[4];
            faces[4] = faces[5];
            faces[5] = temp;
            break;
          case NONE:
            break;
        }
        faces[0].face = Orientation.TOP_SIDE;
        faces[1].face = Orientation.LEFT_SIDE;
        faces[2].face = Orientation.FRONT_SIDE;
        faces[3].face = Orientation.RIGHT_SIDE;
        faces[4].face = Orientation.BOTTOM_SIDE;
        faces[5].face = Orientation.REAR_SIDE;
        yAngle = 0;
        xAngle = (float)Math.PI / 4.0;
    }
    
    CubeState getState(){
      return state;
    }

  class Face {
    
    Face oppositeFace;
    Colors faceColor;
    Orientation face;
    Cube owner;
    
    public Face(Orientation face, Colors faceColor, Cube owner) {
      this.owner = owner;
      this.face = face;
      this.faceColor = faceColor;
    }
    
    void drawFace() {
      switch(faceColor) {
         case RED:
           fill(color(255, 0, 0));
           break;
         case BLUE:
           fill(color(0, 0, 255));
           break;
         case GREEN:
           fill(color(0, 255, 0));
           break;
         case MAGENTA:
           fill(color(255, 0, 255));
           break;
       }
      beginShape();
      switch(face) {
        case FRONT_SIDE:
            vertex(size, -size, size);
            vertex(size, size, size);
            vertex(-size, size, size);
            vertex(-size, -size, size);
          break;
        case REAR_SIDE:
          vertex(size, -size, -size);
          vertex(size, size, -size);
          vertex(-size, size, -size);
          vertex(-size, -size, -size);
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
      if(isSelected){ 
        scale(1.1);
        translate(-40,-40,-40);
      }
      translate(centerX, centerY, centerZ);
      //if(owner.turnDirection == Direction.TURN_UP || owner.turnDirection == Direction.TURN_DOWN)
      rotateX(xAngle);
      rotateZ(yAngle);
      drawFace();
      popMatrix();
    }
    
  }
}
