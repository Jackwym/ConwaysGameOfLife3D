import java.util.*;

public class ConwayBoard {
  public boolean[][] board;
  public boolean[][] machBoard;
  public int size;
  public int boardHeight;
  
  public ConwayBoard(int s) {
    board = new boolean[s][s];
    machBoard = new boolean[s][s];
    size = s;
    boardHeight = 0;
    int rand;
    
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        rand = (int) (Math.random() * 2);
        if (rand == 1) board[i][j] = true;
        else board[i][j] = false;
      }
    }
  }
  
  public ConwayBoard(boolean[][] b) {
    board = b;
    machBoard = new boolean[b.length][b.length];
    size = b.length;
    boardHeight = 0;
  }
  
  public ConwayBoard(int[][] b) {
    board = new boolean[b.length][b.length];
    machBoard = new boolean[b.length][b.length];
    size = b.length;
    boardHeight = 0;
    
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (b[i][j] == 1) board[i][j] = true;
        else board[i][j] = false;
      }
    }
  }
  
  public ConwayBoard updateBoard() {
    int cellCount;
    int applicableRow;
    int applicableColumn;
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        cellCount = 0;
        for (int x = -1; x <= 1; x++) {
          for (int y = -1; y <= 1; y++) {
            if (x == 0 && y == 0) continue;
            applicableRow = i + y;
            applicableColumn = j + x;
            if (i + y < 0) applicableRow = size - 1;
            if (j + x < 0) applicableColumn = size - 1;
            if (i + y >= size) applicableRow = 0;
            if (j + x >= size) applicableColumn = 0;
            
            if (board[applicableRow][applicableColumn]) cellCount++;
            if (cellCount > 3) {
              machBoard[i][j] = false;
              continue;
            }
          }
        }
        if (board[i][j] && !(cellCount == 2 || cellCount == 3)) machBoard[i][j] = false;
        else if (!board[i][j] && cellCount == 3) machBoard[i][j] = true;
        else machBoard[i][j] = board[i][j];
      }
    }
    
    return new ConwayBoard(machBoard);
    //for (int i = 0; i < size; i++) {
    //  for (int j = 0; j < size; j++) {
    //    board[i][j] = machBoard[i][j];
    //  }
    //}
  }
  
  public void show() {
    // sphereDetail(4);
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        pushMatrix();
        translate(10 * (i), boardHeight, 10 * (j));
        // if (board[i][j]) sphere(10);
        if (board[i][j])  {
          if (boardColor == 0) {
            // blue and orange
            fill(255 - (int) (((double) i / size) * 255), 
            255 - (int) ((((double) i / 2 + (double) j / 2) / size) * 255), 
            255 - (int) (((double) j / size) * 255));
          }
          
          if (boardColor == 1) {
            // green and purple
            fill(255 - (int) ((((double) i / 2 + (double) j / 2) / size) * 255), 
            255 - (int) (((double) i / size) * 255), 
            255 - (int) (((double) j / size) * 255));
          }
          
          if (boardColor == 2) {
            // pink and green
            fill(255 - (int) (((double) i / size) * 255), 
            255 - (int) (((double) j / size) * 255), 
            255 - (int) ((((double) i / 2 + (double) j / 2) / size) * 255));
          }
          box(10);
        }
        popMatrix();
      }
    }
  }
  
  public String toString() {
    String ret = "";
    
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (board[i][j]) ret += "1";
        else ret += "0";
      }
      ret += "\n";
    }
    
    return ret;
  }
  
  public boolean equals(ConwayBoard other) {
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (board[i][j] != other.board[i][j]) return false;
      }
    }
    return true;
  }
}

// (int) (Math.random()*(Max-Min))+Min;
