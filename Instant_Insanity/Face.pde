enum Orientation {
  FRONT_SIDE, BOTTOM_SIDE, RIGHT_SIDE, LEFT_SIDE, REAR_SIDE, TOP_SIDE
}

enum Colors {
  RED, BLUE, GREEN, YELLOW 
}

class Face {
 
  Face oppositeFace;
  color faceColor;
  float angle;
  Orientation face;
  
  public Face(color faceColor, Orientation face, Colors faceColor) {
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
    switch(face) {
      case FRONT_SIDE:
        break;
      case REAR_SIDE:
        break;
      case LEFT_SIDE:
        break;
      case RIGHT_SIDE:
        break;
      case TOP_SIDE:
        break;
      case BOTTOM_SIDE:
        break;
      default:
        throw new NullPointerException();
    }
  }
  
  void nextFrame() {
    pushMatrix();
    popMatrix();
  }
  
}
