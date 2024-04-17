int frame = 0;
int camFrame = 0;
int fadeOut = 0;
ArrayList<ConwayBoard> tower = new ArrayList<ConwayBoard>();
int boardColor = 2;

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
  
  // pointLight(50, 100, 130, -320, 80, -260); // blue dark top
  pointLight(50, 100, 130, -320,-80, -260); // blue dark bottom
  // pointLight(20, 20, 130, -320, 80, -260); // dark blue
  // pointLight(50, 200, 130, -320, 180, -260); // emerald
  pointLight(190, 150, 255, -320, 180, -260); // magenta
  // pointLight(230, 230, 230, -320, 180, -260); // off-white
  // pointLight(255, 255, 255, -320, 180, -260); // white
  
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
  
  if (frame % 51 == 0) {
    if (tower.size() > 3 && tower.get(tower.size() - 1).equals(tower.get(tower.size() - 3))) {
      frame--;
      if (frame % 10 == 0) frame = 101;
      fadeOut++;
      fill(0, 0, 0, fadeOut);
      translate(-250, 200, -250);
      box(400);
      if (fadeOut == 255) {
        fadeOut = 0;
        for (int i = 0; i < tower.size(); i++) {
          tower = new ArrayList<ConwayBoard>();
        }
        tower.add(new ConwayBoard(20));
        boardColor++;
        if (boardColor == 3) boardColor = 0;
        frame = 0;
      }
    }
  }
  
  if (frame % 2501 == 0) {
    for (int i = 1; i < tower.size(); i++) {
      if (tower.size() > 3 && tower.get(0).equals(tower.get(i))) {
        frame--;
        fadeOut++;
        fill(0, 0, 0, fadeOut);
        translate(-250, 200, -250);
        box(400);
        if (fadeOut == 255) {
          fadeOut = 0;
          for (int j = 0; j < tower.size(); j++) {
            tower = new ArrayList<ConwayBoard>();
          }
          tower.add(new ConwayBoard(20));
          boardColor++;
          if (boardColor == 3) boardColor = 0;
          frame = 0;
        }
        break;
      }
    }
  }
}
