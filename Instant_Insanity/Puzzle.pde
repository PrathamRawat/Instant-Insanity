class Puzzle {
  Cube[] cubes;
  int selectedCube;
  boolean isSolved;
  GameState gameState;
  ArrayList<GameState> gameStates;
  
  public Puzzle(){
    isSolved = false;
    cubes = new Cube[4];
    cubes[0] = new Cube(displayWidth / 2, 1 * displayHeight / 5, 0, 50);
    cubes[1] = new Cube(displayWidth / 2, 2 * displayHeight / 5, 0, 50);
    cubes[2] = new Cube(displayWidth / 2, 3 * displayHeight / 5, 0, 50);
    cubes[3] = new Cube(displayWidth / 2, 4 * displayHeight / 5, 0, 50);
    selectedCube = 0;
    
    gameStates = new ArrayList<GameState>();
    gameState = new GameState();
  }
  
  void puzzle(String state){
    cubes = new Cube[4];
    //cubes[0] = new Cube(displayWidth / 2, 1 * displayHeight / 5, 0);
    //cubes[1] = new Cube(displayWidth / 2, 2 * displayHeight / 5, 0);
    //cubes[2] = new Cube(displayWidth / 2, 3 * displayHeight / 5, 0);
    //cubes[3] = new Cube(displayWidth / 2, 4 * displayHeight / 5, 0);
  }
  
  void moveSelectorUp() {
     if(selectedCube != 0) selectedCube--; 
  }

  void moveSelectorDown() {
     if(selectedCube != 3) selectedCube++; 
  }
  
  void turnUp() {
    cubes[selectedCube].rotate(Direction.TURN_UP);  
  }
  
  void turnDown() {
    cubes[selectedCube].rotate(Direction.TURN_DOWN);  
  }
  
  void turnLeft() {
    cubes[selectedCube].rotate(Direction.TURN_LEFT);  
  }
  
  void turnRight() {
    cubes[selectedCube].rotate(Direction.TURN_RIGHT);  
  }
  
  GameState saveState(){
    return gameState;
  }
  
  void solve(){
  }
  
  void scramble(){
  }
  
  void updatePuzzleFrame() {
    for(Cube cube: cubes) {
       cube.updateState();
    }
  }
  
  void displayPuzzleFrame() {
    for(Cube cube: cubes) {
       cube.drawNextFrame();
    }
  }
  
  GameState newPuzzle(){
    return gameState;
  }
  
  void rot(int cube, int direction){
  }
  
  void loadState(){
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
