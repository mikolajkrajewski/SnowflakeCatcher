Snowflake [] squad;
void setup()
{
  size(600,600);
  background(0);
  squad = new Snowflake[101];
  for(int i=0; i<squad.length; i++)
  {
    squad[i] = new Snowflake();
  }
  frameRate(960);
}
void draw()
{
  for(int i=0; i<squad.length; i++)
  {
    squad[i].erase();
    squad[i].lookDown();
    squad[i].move();
    squad[i].wrap();
    squad[i].show();
  }
}
void mouseDragged()
{
  if(mousePressed == true && mouseButton == LEFT)
  {
    stroke(0,255,0);
    fill(0,255,0);
    ellipse(mouseX,mouseY,10,10);
  }
  else if(mousePressed == true && mouseButton == RIGHT)
  {
    stroke(0);
    fill(0);
    ellipse(mouseX,mouseY,40,40);
  }
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
    stroke(255);
    fill(255);
    ellipse(x,y,5,5);
  }
  void lookDown()
  {
    if(y > -10 && y < 590 && get(x,y+6) == color(0,255,0))
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
    stroke(0);
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




