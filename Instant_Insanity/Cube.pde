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
      state = '';
    }
    
    void drawNextFrame(){
    }
    
    void updateState(){
    }
    
    String getState(){
    }
    
    
}