int frame = 0;
int camFrame = 0;
ArrayList<ConwayBoard> tower = new ArrayList<ConwayBoard>();

public void setup() {
  //boolean[][] board = {{false, false, false, false, false}, 
  //                      {true, false, false, false, false}, 
  //                      {true, false, false, false, false}, 
  //                      {true, false, false, false, false}, 
  //                      {false, false, false, false, false}};
  
  int[][] board = {{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                   {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                   {0, 0, 1, 1, 0, 0, 0, 0, 0}, 
                   {1, 0, 0, 0, 0, 1, 0, 0, 0}, 
                   {0, 0, 0, 0, 0, 0, 1, 0, 0}, 
                   {1, 0, 0, 0, 0, 0, 1, 0, 0}, 
                   {0, 1, 1, 1, 1, 1, 1, 0, 0}, 
                   {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                   {0, 0, 0, 0, 0, 0, 0, 0, 0}};
  
  size(900, 900, P3D);
  background(0);
  tower.add(new ConwayBoard(20));
  // tower.add(new ConwayBoard(board));
  frameRate(100);
  noStroke();
  spotLight(90, 45, 130, -250, 100, 250, 0, 0, -1, 2 * PI, 500); 
}

public void draw() {
  frame++;
  background(0);
  
  // pointLight(50, 100, 130, -320, 80, -260); // blue
  // pointLight(20, 20, 130, -320, 80, -260); // dark blue
  // pointLight(50, 200, 130, -320, 180, -260); // emerald
  pointLight(190, 150, 255, -320, 180, -260); // magenta
  
  lightSpecular(0, 0, 0);
  // directionalLight(110, 200, 255, 1, -2, -1); // light blue highlight
  // directionalLight(180, 140, 245, 1, -2, -1); // magenta highlight
  
  camera(-250, 200, -250, 0, 0, 0, 0, -1, 0);
  
  for (ConwayBoard cb : tower) {
    cb.show();
    cb.boardHeight--;
  }
  
  if (frame % 10 == 0) {
    if (tower.size() > 80) tower.remove(0);
    tower.add(tower.get(tower.size() - 1).updateBoard());
  }
}
