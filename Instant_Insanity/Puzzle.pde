class Puzzle {
  Cube[] cubes;
  boolean isSolved;
  GameState gameState;
  ArrayList<GameState> gameStates;
  
  public Puzzle(){
    isSolved = false;
    cubes = new Cube[4];
    gameStates = new ArrayList<GameState>();
    gameState = new GameState();
  }
  
  void puzzle(String state){
    
  }
  
  
  GameState saveState(){
    return gameState;
  }
  
  void solve(){
  }
  
  void scramble(){
  }
  
  GameState newPuzzle(){
    return gameState;
  }
  
  void rot(int cube, int direction){
  }
  
  void loadState(){
  }
    
class Cube {
    Face[] faces;
    float xAngle;
    float yAngle;
    float xVelocity;
    float yVelocity;
    String state;
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
      state = "";
      int counter = 0;
      for(Orientation faceSide: Orientation.values()) {
        faces[counter] = new Face(faceSide, Colors.RED);
        counter++;
      }
    }
    
    void drawNextFrame(){
      for(Face face: faces) {
        face.drawNextFrame();
      }
    }
    
    void updateState() {
      
    }
    
    void rotate(Direction turnDirection) {
      
    }
    
    String getState(){
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
  class GameState{
    String state;
    public GameState(){
      state = "";
    }
    String toString(){
      return state;
    }
    void updateState(String newState){
      state = newState;
    }
    void clearState(){
      state = "";
    }
  }
  
  
}
