
class Joystick
{
  float xpos;
  float ypos;
  float typos;
  float txpos;
  float size;
  float sp = 100;
  PVector value = new PVector();
  boolean move = false;
  Joystick(float x, float y, float csize)
  {
    mt = new MultiTouch[maxTouchEvents];
    for (int i=0; i < maxTouchEvents; i++) {
      mt[i] = new MultiTouch();
    }
    xpos = x;
    ypos = y;
    size = csize;
    txpos = xpos;
    typos = ypos;
  }
  void display()
  {
    pushMatrix();
    pushStyle();
    fill(255, 255, 255, 0.1);
    rectMode(CENTER);
    stroke(0);

    value.x = (txpos-xpos)/sp;
    value.y = (typos-ypos)/sp;
    if ( over())
    {
      move = true;
    }else{
      move = false;
    }
    ellipse( xpos, ypos, size, size);
    if ( move == true)
    {
      if (mousePressed == true)
      {
        for (int i=0; i < maxTouchEvents; i++)
        {
          if (mt[i].touched == true)
          {
            if (mt[i].motionX <= xpos+sp && mt[i].motionX >= xpos-sp)
            {
              txpos = mt[i].motionX;
            }
            if (mt[i].motionY <= ypos+sp && mt[i].motionY >= ypos-sp)
            {
              typos = mt[i].motionY;
            }
          }
        }
      }
    }

    popStyle();
    pushStyle();
    fill(255, 255, 255);
    ellipse( txpos, typos, size/2, size/2);
    popStyle();
    popMatrix();
  }


  // Test to see if mouse is over this Joystick button
  boolean over()
  {
    boolean isOver = false;
    for (int i=0; i < maxTouchEvents; i++)
    {
      if ( mt[i].touched == true)
      {
        float disX = xpos - mt[i].motionX;
        float disY = ypos - mt[i].motionY;
        if (sqrt(sq(disX) + sq(disY)) <(size / 2) )
        {
          isOver = true;
        } else {
          isOver = false;
        }
      }
    }
    return isOver;
  }
  public void leaveMe()
  {
    move = false;
    typos = ypos ;
    txpos = xpos ;
  }
}
