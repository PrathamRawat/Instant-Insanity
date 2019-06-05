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
    gameState.updateState(gameState.generator.cubeSet(gameState.generator.newPuz()));
    this.loadState(gameState);
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

  void myprint(int[][] stuff){
    for(int i = 0; i < stuff.length; i++){
      for(int j = 0; j < stuff[0].length; j++){
        print(stuff[i][j] + " ");
      }
      println();
    }
    println();
  }
  
  void solve(){
    int[][] orientations = gameState.generator.solve(gameState.state);
    myprint(orientations);
    for(int i = 0; i < 4; i++){
      switch(orientations[i][0]){
        case 0:
          //print("none ");
          break;
        case 1:
          Direction[] case1instructions = {Direction.TURN_RIGHT, Direction.TURN_UP, Direction.TURN_LEFT};
          cubes[i].rotSequence(case1instructions);
          //print("right ");
          break;
        case 2:
          Direction[] case2instructions = {Direction.TURN_UP};
          cubes[i].rotSequence(case2instructions);
          //print("up ");
          break;
        case 3:
          Direction[] case3instructions = {Direction.TURN_LEFT, Direction.TURN_UP, Direction.TURN_RIGHT};
          cubes[i].rotSequence(case3instructions);
          //print("left ");
          break;
        case 4:
          Direction[] case4instructions = {Direction.TURN_UP, Direction.TURN_UP};
          cubes[i].rotSequence(case4instructions);
          //print("up-up ");
          break;
        case 5:
          Direction[] case5instructions = {Direction.TURN_DOWN};
          cubes[i].rotSequence(case5instructions);
          //print("down ");
          break;
      }
    //  cubes[i].rotate(Direction.TURN_RIGHT);
    //  switch(orientations[i][1]){
    //    case 0:
    //      println("none");
    //      break;
    //    case 1:
    //      cubes[i].rotate(Direction.TURN_UP);
    //      println("left");
    //      break;
    //    case 2:
    //      cubes[i].rotate(Direction.TURN_DOWN);
    //      cubes[i].rotate(Direction.TURN_DOWN);
    //      println("right-right");
    //      break;
    //    case 3:
    //      cubes[i].rotate(Direction.TURN_DOWN);
    //      println("right");
    //      break;
    //  }
    //  cubes[i].rotate(Direction.TURN_LEFT);
    }
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
  
  boolean isSolved() {
     return false;
  }
  
  void loadState(GameState myState){
    for(int cubenum = 0; cubenum < 4; cubenum++){
      for(Orientation orientation : Orientation.values()){
        switch(orientation){
          case TOP_SIDE:
            cubes[cubenum].faces[0].faceColor = myState.state[cubenum][5];
            break;
          case LEFT_SIDE:
            cubes[cubenum].faces[1].faceColor = myState.state[cubenum][1];
            break;
          case FRONT_SIDE:
            cubes[cubenum].faces[2].faceColor = myState.state[cubenum][0];
            break;
          case RIGHT_SIDE:
            cubes[cubenum].faces[3].faceColor = myState.state[cubenum][3];
            break;
          case BOTTOM_SIDE:
            cubes[cubenum].faces[4].faceColor = myState.state[cubenum][2];
            break;
          case REAR_SIDE:
            cubes[cubenum].faces[5].faceColor = myState.state[cubenum][4];
            break;
        }
      }
    }
    println(this.gameState);
  }
  
  class GameState{
    Colors[][] state;
    CubeGen generator;
    
    public GameState(){
      state = new Colors[4][6];
      generator = new CubeGen();
    }
    
    String toString(){
      String result = "";
      for(int i = 0; i < 4; i++){
        for(int j = 0; j < 6; j++){
          result += state[i][j] + " ";
        }
        result += "\n";
      }
      return result;
    }
    
    void updateState(Colors[][] newState){
      state = newState;
    }
    void clearState(){
      state = new Colors[4][6];
    }
    
class CubeGen{

  Colors[][] cubeSet(Colors[][] tower){//returns in the form {top, left, front, right, bottom, back}
    Colors[][] cubes = new Colors[4][6];
    Colors[][] tow = newPuz();
    int topface = (int)(6 * Math.random());
    for(int i = 0; i < 4; i++){
      if(topface == 0){
      Colors[] topandbot = topBot(tow[i]);
      cubes[i][0] = topandbot[0];
      cubes[i][1] = tow[i][0];
      cubes[i][2] = tow[i][1];
      cubes[i][3] = tow[i][2];
      cubes[i][4] = topandbot[1];
      cubes[i][5] = tow[i][3];
    }
      if(topface == 1){
      Colors[] topandbot = topBot(tow[i]);
      cubes[i][0] = tow[i][0];
      cubes[i][1] = topandbot[1];
      cubes[i][2] = tow[i][1];
      cubes[i][3] = topandbot[0];
      cubes[i][4] = tow[i][2];
      cubes[i][5] = tow[i][3];
    }
      if(topface == 2){
      Colors[] topandbot = topBot(tow[i]);
      cubes[i][0] = tow[i][1];
      cubes[i][1] = tow[i][0];
      cubes[i][2] = topandbot[1];
      cubes[i][3] = tow[i][2];
      cubes[i][4] = tow[i][3];
      cubes[i][5] = topandbot[0];
    }
      if(topface == 3){
      Colors[] topandbot = topBot(tow[i]);
      cubes[i][0] = tow[i][2];
      cubes[i][1] = topandbot[0];
      cubes[i][2] = tow[i][1];
      cubes[i][3] = topandbot[1];
      cubes[i][4] = tow[i][0];
      cubes[i][5] = tow[i][3];
    }
      if(topface == 4){
      Colors[] topandbot = topBot(tow[i]);
      cubes[i][0] = topandbot[1];
      cubes[i][1] = tow[i][0];
      cubes[i][2] = tow[i][3];
      cubes[i][3] = tow[i][2];
      cubes[i][4] = topandbot[0];
      cubes[i][5] = tow[i][1];
    }
      if(topface == 5){
      Colors[] topandbot = topBot(tow[i]);
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
  
  Colors[][] newPuz(){
    Colors[] colors = {Colors.RED, Colors.GREEN, Colors.BLUE, Colors.MAGENTA};
    Colors[][] sides = new Colors[4][4];
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
      for(int x = 0; x < rot; x++){
        Colors temp = sides[k][0];
      for(int l = 0; l < 3; l++){
        sides[k][l] = sides[k][l + 1];
      }
      sides[k][3] = temp;
    }
    }
    return sides;
  }

  Colors[] topBot(Colors[] cube){
    int numDif = 4;
    int numred = 0;
    int numblue = 0;
    int numgreen = 0;
    int nummag = 0;
    for(int i = 0; i < 4; i++){
      if(cube[i] == Colors.RED) numred++;
      if(cube[i] == Colors.BLUE) numblue++;
      if(cube[i] == Colors.GREEN) numgreen++;
      if(cube[i] == Colors.MAGENTA) nummag++;
    }
    if(numred == 0) numDif--;
    if(numblue == 0) numDif--;
    if(numgreen == 0) numDif--;
    if(nummag == 0) numDif--;
    ArrayList<Colors> options = new ArrayList<Colors>();
    Colors[] topandbot = new Colors[2];
    if(numDif == 4){
      options.add(Colors.RED);
      options.add(Colors.BLUE);
      options.add(Colors.GREEN);
      options.add(Colors.MAGENTA);
      for(int j = 0; j < 2; j++){
        topandbot[j] = options.get((int)(Math.random() * 4));
      }
    }//This covers the scenario of 4 distinct colors
    if(numDif == 3){
      if(numred == 0){
        topandbot[0] = Colors.RED;
      }
      if(numblue == 0){
        topandbot[0] = Colors.BLUE;
      }
      if(numgreen == 0){
        topandbot[0] = Colors.GREEN;
      }
      if(nummag == 0){
        topandbot[0] = Colors.MAGENTA;
      }
      options.add(Colors.RED);
      options.add(Colors.BLUE);
      options.add(Colors.GREEN);
      options.add(Colors.MAGENTA);
      topandbot[1] = options.get((int)(Math.random() * 4));
    }
    if(numDif == 2){
      if(numred == 0){
        options.add(Colors.RED);
      }
      if(numblue == 0){
        options.add(Colors.BLUE);
      }
      if(numgreen == 0){
        options.add(Colors.GREEN);
      }
      if(nummag == 0){
        options.add(Colors.MAGENTA);
      }
      for(int j = 0; j < 2; j++){
        topandbot[j] = options.remove((int)(Math.random() * (2 - j)));
      }
    }
    return topandbot;
  }
  
  boolean isBad(Colors[][] sides){
    for(int r = 0; r < 4; r++){
      int numred = 0;
      int numblue = 0;
      int numgreen = 0;
      int nummag = 0;
      for(int c = 0; c < 4; c++){
        if(sides[r][c] == Colors.RED) numred++;
        if(sides[r][c] == Colors.BLUE) numblue++;
        if(sides[r][c] == Colors.GREEN) numgreen++;
        if(sides[r][c] == Colors.MAGENTA) nummag++;
      }
       //System.out.println(numred + " " + numblue + " " + numgreen + " " + nummag);
      if(numred == 4 || numblue == 4 || numgreen == 4 || nummag == 4) return true;
    }
    return false;
  }
  
  int[][] solve(Colors[][] puz){
      Colors[][] orig = new Colors[4][6];
      for(int i = 0; i < 4; i++){
        for(int j = 0; j < 6; j++){
          orig[i][j] = puz[i][j];
        }
      }
      int[][] orientations = new int[4][2];
      return solveH(puz, orig, 0, orientations);
    }

  int[][] solveH(Colors[][] puz, Colors[][] orig, int cubenum, int[][] orientations){//returns instructions for how to rotate cubes into solved position
    //also modifies the puzzle's game state
    if(cubenum == 4){
      if(cpuisSolved(puz)) return orientations;
      return new int[5][2];
    }
    else{
      for(int top = 0; top < 6; top++){
        if(cubenum == 0){
          orient(puz, orig, cubenum, top, 0);
          orientations[cubenum][0] = top;
          orientations[cubenum][1] = 0;
          int[][] result = solveH(puz, orig, cubenum + 1, orientations);
          if(result.length == 4) return result;
        }
          for(int i = 0; i < 6; i++){
            puz[cubenum][i] = orig[cubenum][i];
          }
        if(cubenum > 0){
          for(int front = 0; front < 4; front++){
          orient(puz, orig, cubenum, top, front);
          orientations[cubenum][0] = top;
          orientations[cubenum][1] = front;
          int[][] result = solveH(puz, orig, cubenum + 1, orientations);
          if(result.length == 4) return result;
          for(int i = 0; i < 6; i++){
            puz[cubenum][i] = orig[cubenum][i];
          }
        }
        }
      }
      }
    return new int[5][2];
  }
  }

  void orient(Colors[][] puz, Colors[][] puzorig, int cubenum, int top, int front){
    if(top == 0){
      puz[cubenum][0] = puzorig[cubenum][0];
      puz[cubenum][1] = puzorig[cubenum][1];
      puz[cubenum][2] = puzorig[cubenum][2];
      puz[cubenum][3] = puzorig[cubenum][3];
      puz[cubenum][4] = puzorig[cubenum][4];
      puz[cubenum][5] = puzorig[cubenum][5];
    }

    if(top == 1){
      puz[cubenum][0] = puzorig[cubenum][1];
      puz[cubenum][1] = puzorig[cubenum][4];
      puz[cubenum][2] = puzorig[cubenum][2];
      puz[cubenum][3] = puzorig[cubenum][0];
      puz[cubenum][4] = puzorig[cubenum][3];
      puz[cubenum][5] = puzorig[cubenum][5];
    }

    if(top == 2){
      puz[cubenum][0] = puzorig[cubenum][2];
      puz[cubenum][1] = puzorig[cubenum][1];
      puz[cubenum][2] = puzorig[cubenum][4];
      puz[cubenum][3] = puzorig[cubenum][3];
      puz[cubenum][4] = puzorig[cubenum][5];
      puz[cubenum][5] = puzorig[cubenum][0];
    }

    if(top == 3){
      puz[cubenum][0] = puzorig[cubenum][3];
      puz[cubenum][1] = puzorig[cubenum][0];
      puz[cubenum][2] = puzorig[cubenum][2];
      puz[cubenum][3] = puzorig[cubenum][4];
      puz[cubenum][4] = puzorig[cubenum][1];
      puz[cubenum][5] = puzorig[cubenum][5];
    }

    if(top == 4){
      puz[cubenum][0] = puzorig[cubenum][4];
      puz[cubenum][1] = puzorig[cubenum][1];
      puz[cubenum][2] = puzorig[cubenum][5];
      puz[cubenum][3] = puzorig[cubenum][3];
      puz[cubenum][4] = puzorig[cubenum][0];
      puz[cubenum][5] = puzorig[cubenum][2];
    }

    if(top == 5){
      puz[cubenum][0] = puzorig[cubenum][5];
      puz[cubenum][1] = puzorig[cubenum][1];
      puz[cubenum][2] = puzorig[cubenum][0];
      puz[cubenum][3] = puzorig[cubenum][3];
      puz[cubenum][4] = puzorig[cubenum][2];
      puz[cubenum][5] = puzorig[cubenum][4];
    }
    
    Colors[][] saved = new Colors[4][6];

    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 6; j++){
        saved[i][j] = puz[i][j];
      }
    }
    if(front == 0){
       puz[cubenum][1] = saved[cubenum][1];
       puz[cubenum][2] = saved[cubenum][2];
       puz[cubenum][3] = saved[cubenum][3];
       puz[cubenum][5] = saved[cubenum][5];
     }
     if(front == 1){
       puz[cubenum][1] = saved[cubenum][2];
       puz[cubenum][2] = saved[cubenum][3];
       puz[cubenum][3] = saved[cubenum][5];
       puz[cubenum][5] = saved[cubenum][1];
     }
     if(front == 2){
       puz[cubenum][1] = saved[cubenum][3];
       puz[cubenum][2] = saved[cubenum][5];
       puz[cubenum][3] = saved[cubenum][1];
       puz[cubenum][5] = saved[cubenum][2];
     }
     if(front == 3){
       puz[cubenum][1] = saved[cubenum][5];
       puz[cubenum][2] = saved[cubenum][1];
       puz[cubenum][3] = saved[cubenum][2];
       puz[cubenum][5] = saved[cubenum][3];
     }
  }

  boolean cpuisSolved(Colors[][] puz){      
    int[] search  = {1, 2, 3, 5};
    for(int i = 0; i < 4; i++){
      boolean isRed = false;
      boolean isBlue = false;
      boolean isGreen = false;
      boolean isMag = false;
      for(int j = 0; j < 4; j++){
        if(puz[j][search[i]] == Colors.RED) isRed = true;
        if(puz[j][search[i]] == Colors.BLUE) isBlue = true;
        if(puz[j][search[i]] == Colors.GREEN) isGreen = true;
        if(puz[j][search[i]] == Colors.MAGENTA) isMag = true;
      }
      if(!(isRed && isBlue && isGreen && isMag)) return false;
    }
    return true;
  }
  
}
    
    
    
  }
  
  
