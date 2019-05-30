import java.util.*;
class CubeGen{
  public static void main(String[] args){
    String[][] sides = cubeSet(newPuzzle());
    for(int r = 0; r < 4; r++){
      for(int c = 0; c < 6; c++){
        System.out.print(sides[r][c] + " ");
      }
      System.out.println();
    }
    //System.out.println(isBad(sides));
  }

  public static String[][] cubeSet(String[][] tower){//returns in the form {top, left, front, right, bottom, back}
    String[][] cubes = new String[4][6];
    String[][] tow = newPuzzle();
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
  
  public static String[][] newPuzzle(){
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
      return newPuzzle();
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

  public static String[] topBot(String[] cube){
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
  
  public static boolean isBad(String[][] sides){
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

class CubeSolver{

}

class Graph{
  class Node{
    int num;//red, blue, green, yellow
    ArrayList<Node> connections;
    public Node(int myNum){
      num = myNum;
      connections = new ArrayList<Node>();
    }
    public void addNode(Node num){
      connections.add(num);
    }
    public int coltonum(String col){
    if(col == "r") return 0;
    if(col == "b") return 1;
    if(col == "g") return 2;
    if(col == "y") return 3;
    return -1;
  }

  }

}
