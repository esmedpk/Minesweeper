

import de.bezier.guido.*;
int NUM_ROWS = 20;
int NUM_COLS = 20;
int NUM_BOMBS = 50;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new <MSButton> ArrayList(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
   
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int x = 0; x < buttons.length; x++)
      for(int y = 0; y < buttons.length; y++)
        buttons[x][y] = new MSButton(x,y);

    setBombs();
}
public void setBombs()
{
  while(bombs.size() < NUM_BOMBS)
  {
    int r = (int)(Math.random()*NUM_ROWS);
    int c = (int)(Math.random()*NUM_COLS);
    if(!bombs.contains(buttons[r][c]))
    {
      bombs.add(buttons[r][c]);
      System.out.println(r + "," + c);
    }
  }
  
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if(mouseButton == RIGHT)
          marked = false;
          if(marked = false)
            clicked = false;
        else if(bombs.contains(this))
          displayLosingMessage();
        else if(countBombs() > 0
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if(r<=NUM_ROWS && c<=NUM_COLS)
          return true;
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(isValid(row-1,col-1)==true && buttons[row][col-1].isMarked()== true)
          numBombs++;
        if(isValid(row-1,col)==true && buttons[row][col+1].isMarked()== true)
          numBombs++;
        if(isValid(row-1,col+1)==true && buttons[row][col+1].isMarked()== true)
          numBombs++;
        if(isValid(row,col-1)==true && buttons[row][col+1].isMarked()== true)
          numBombs++;
        if(isValid(row,col+1)==true && buttons[row][col+1].isMarked()== true)
          numBombs++;
        if(isValid(row+1,col-1)==true && buttons[row][col+1].isMarked()== true)
          numBombs++; 
        if(isValid(row+1,col)==true && buttons[row][col+1].isMarked()== true)
          numBombs++;
        if(isValid(row+1,col+1)==true && buttons[row][col+1].isMarked()== true)
          numBombs++;
        return numBombs;
    }
}
