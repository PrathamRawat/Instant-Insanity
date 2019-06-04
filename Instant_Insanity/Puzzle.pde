class Puzzle {
  Cube[] cubes;
  int selectedCube;
  boolean isSolved;
  GameState gameState;
  ArrayList<GameState> gameStates;
  
  public Puzzle(){
    isSolved = false;
    cubes = new Cube[4];
    cubes[0] = new Cube(1 * displayWidth / 5, displayHeight / 2, 0, displayWidth / 15);
    cubes[1] = new Cube(2 * displayWidth / 5, displayHeight / 2, 0, displayWidth / 15);
    cubes[2] = new Cube(3 * displayWidth / 5, displayHeight / 2, 0, displayWidth / 15);
    cubes[3] = new Cube(4 * displayWidth / 5, displayHeight / 2, 0, displayWidth / 15);
    selectedCube = 0;
    cubes[0].select();
    
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
  
  void moveSelectorLeft() {
     if(selectedCube != 0){ 
       cubes[selectedCube].select();
       selectedCube--; 
       cubes[selectedCube].select();
     }
  }

  void moveSelectorRight() {
     if(selectedCube != 3){ 
       cubes[selectedCube].select();
       selectedCube++; 
       cubes[selectedCube].select();
     }
  }
  
  void turnUp() {
    cubes[selectedCube].rotate(Direction.TURN_UP);  
  }
  
  void turnAllUp() {
    for(Cube cube: cubes) {
      cube.rotate(Direction.TURN_UP);
    }
  }
  
  void turnAllDown() {
    for(Cube cube: cubes) {
      cube.rotate(Direction.TURN_DOWN);
    }
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
    
class CubeGen{

  String[][] cubeSet(String[][] tower){//returns in the form {top, left, front, right, bottom, back}
    String[][] cubes = new String[4][6];
    String[][] tow = newPuz();
    int topface = (int)(6 * Math.random());
    for(int i = 0; i < 4; i++){
      if(topface == 0){
      String[] topandbot = topBot(tow[i]);
      cubes[i][0] = topandbot[0];
      cubes[i][1] = tow[i][0];
      cubes[i][2] = tow[i][1];
      cubes[i][3] = tow[i][2];
      cubes[i][4] = topandbot[1];
      cubes[i][5] = tow[i][3];
    }
      if(topface == 1){
      String[] topandbot = topBot(tow[i]);
      cubes[i][0] = tow[i][0];
      cubes[i][1] = topandbot[1];
      cubes[i][2] = tow[i][1];
      cubes[i][3] = topandbot[0];
      cubes[i][4] = tow[i][2];
      cubes[i][5] = tow[i][3];
    }
      if(topface == 2){
      String[] topandbot = topBot(tow[i]);
      cubes[i][0] = tow[i][1];
      cubes[i][1] = tow[i][0];
      cubes[i][2] = topandbot[1];
      cubes[i][3] = tow[i][2];
      cubes[i][4] = tow[i][3];
      cubes[i][5] = topandbot[0];
    }
      if(topface == 3){
      String[] topandbot = topBot(tow[i]);
      cubes[i][0] = tow[i][2];
      cubes[i][1] = topandbot[0];
      cubes[i][2] = tow[i][1];
      cubes[i][3] = topandbot[1];
      cubes[i][4] = tow[i][0];
      cubes[i][5] = tow[i][3];
    }
      if(topface == 4){
      String[] topandbot = topBot(tow[i]);
      cubes[i][0] = topandbot[1];
      cubes[i][1] = tow[i][0];
      cubes[i][2] = tow[i][3];
      cubes[i][3] = tow[i][2];
      cubes[i][4] = topandbot[0];
      cubes[i][5] = tow[i][1];
    }
      if(topface == 5){
      String[] topandbot = topBot(tow[i]);
      cubes[i][0] = tow[i][3];
      cubes[i][1] = tow[i][0];
      cubes[i][2] = topandbot[0];
      cubes[i][3] = tow[i][2];
      cubes[i][4] = tow[i][1];
      cubes[i][5] = topandbot[1];
    }
    }
    return cubes;
  }
  
  String[][] newPuz(){
    String[] colors = {"r", "g", "b", "y"};
    String[][] sides = new String[4][4];
    for(int i = 0; i < 4; i++){
      ArrayList<Integer> options = new ArrayList<Integer>();
      for(int j = 0; j < 4; j++){
        options.add(j);
      }
      for(int t = 0; t < 4; t++){
        int r = (int)(Math.random() * (4 - t));
        sides[t][i] = colors[options.remove(r)];
      }
      
    }
    if(isBad(sides)){
      return newPuz();
    }
    for(int k = 0; k < 4; k++){
      int rot = (int) (4 * Math.random());
      for(int l = 0; l < 4; l++){
        String temp = sides[k][(l + rot) % 4];
        sides[k][(l + rot) % 4] = sides[k][l];
        sides[k][l] = temp;
      }
    }
    return sides;
  }

  String[] topBot(String[] cube){
    int numDif = 4;
    int numred = 0;
    int numblue = 0;
    int numgreen = 0;
    int numyel = 0;
    for(int i = 0; i < 4; i++){
      if(cube[i] == "r") numred++;
      if(cube[i] == "b") numblue++;
      if(cube[i] == "g") numgreen++;
      if(cube[i] == "y") numyel++;
    }
    if(numred == 0) numDif--;
    if(numblue == 0) numDif--;
    if(numgreen == 0) numDif--;
    if(numyel == 0) numDif--;
    ArrayList<String> options = new ArrayList<String>();
    String[] topandbot = new String[2];
    if(numDif == 4){
      options.add("r");
      options.add("b");
      options.add("g");
      options.add("y");
      for(int j = 0; j < 2; j++){
        topandbot[j] = options.get((int)(Math.random() * 4));
      }
    }//This covers the scenario of 4 distinct colors
    if(numDif == 3){
      if(numred == 0){
        topandbot[0] = "r";
      }
      if(numblue == 0){
        topandbot[0] = "b";
      }
      if(numgreen == 0){
        topandbot[0] = "g";
      }
      if(numyel == 0){
        topandbot[0] = "y";
      }
      options.add("r");
      options.add("b");
      options.add("g");
      options.add("y");
      topandbot[1] = options.get((int)(Math.random() * 4));
    }
    if(numDif == 2){
      if(numred == 0){
        options.add("r");
      }
      if(numblue == 0){
        options.add("b");
      }
      if(numgreen == 0){
        options.add("g");
      }
      if(numyel == 0){
        options.add("y");
      }
      for(int j = 0; j < 2; j++){
        topandbot[j] = options.remove((int)(Math.random() * (2 - j)));
      }
    }
    return topandbot;
  }
  
  boolean isBad(String[][] sides){
    for(int r = 0; r < 4; r++){
      int numred = 0;
      int numblue = 0;
      int numgreen = 0;
      int numyel = 0;
      for(int c = 0; c < 4; c++){
        if(sides[r][c] == "r") numred++;
        if(sides[r][c] == "b") numblue++;
        if(sides[r][c] == "g") numgreen++;
        if(sides[r][c] == "y") numyel++;
      }
       //System.out.println(numred + " " + numblue + " " + numgreen + " " + numyel);
      if(numred == 4 || numblue == 4 || numgreen == 4 || numyel == 4) return true;
    }
    return false;
  }
}
    
    
    
  }
  
  
}
