Snowflake [] squad;
Bubble [] team;
void setup()
{
  size(600,600);
  squad = new Snowflake[101];
  for(int i=0; i<squad.length; i++)
  {
    squad[i] = new Snowflake();
  }
  team = new Bubble[102];
  for(int b=0; b<team.length; b++)
  {
    team[b] = new Bubble();
  }
  frameRate(480);
}
void draw()
{
  background(0);
  for(int i=0; i<squad.length; i++)
  {
    squad[i].erase();
    //squad[i].lookDown();
    squad[i].move();
    squad[i].wrap();
    squad[i].show();
  }
  for(int b=0; b<team.length; b++)
  {
    team[b].bErase();
    //team[b].bLookUp();
    team[b].bMove();
    team[b].bWrap();
    team[b].bShow();
  }
}
void mouseDragged()
{
  //your code here
}

class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*600);
    y = (int)(Math.random()*600);
    isMoving = true;
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x,y,10,10);
  }
  void lookDown()
  {
    if(y > 0 && y < 600 && get(x,y+6) == color(0,0,255))
    {
      isMoving = false;
    }
    else
    {
      isMoving = true;
    }
  }
  void erase()
  {
    //set fill to black?
    noStroke();
    fill(0);
    ellipse(x,y,7,7);
  }
  void move()
  {
    if(isMoving == true)
    {
      y+=2;
    }
  }
  void wrap()
  {
    if(y > 600)
    {
      y = 0;
      x = (int)(Math.random()*600);
    }
  }
}
class Bubble
{
  int x, y;
  boolean goesUp;
  Bubble()
  {
    x = (int)(Math.random()*600);
    y = (int)(Math.random()*600);
    goesUp = true;
  }
  void bShow()
  {
    noStroke();
    fill(20,180,250);
    ellipse(x,y,15,15);
  }
  void bLookUp()
  {
    if(y > 0 && y < 600 && get(x,y-8) == color(255,0,0))
    {
      goesUp = false;
    }
    else 
    {
      goesUp = true;
    }
  }
  void bErase()
  {
    noStroke();
    fill(0);
    ellipse(x,y,17,17);
  }
  void bMove()
  {
    if(goesUp == true)
    {
      y-=3;
    }
  }
  void bWrap()
  {
    if(y < 0)
    {
      y = 600;
      x = (int)(Math.random()*600);
    }
  }
}



