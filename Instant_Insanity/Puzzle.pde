class Puzzle {
  Cube[] cubes;
  boolean isSolved;
  GameState gameState;
  ArrayList<GameState> gameStates;
  
  public Puzzle(){
    isSolved = false;
    cubes = new Cube[4];
    cubes[0] = new Cube(displayWidth / 2.0, 1.0 * displayHeight / 5, 0.0, 50.0);
    cubes[1] = new Cube(displayWidth / 2, 2 * displayHeight / 5, 0, 50);
    cubes[2] = new Cube(displayWidth / 2, 3 * displayHeight / 5, 0, 50);
    cubes[3] = new Cube(displayWidth / 2, 4 * displayHeight / 5, 0, 50);
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
