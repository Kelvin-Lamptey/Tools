class Button
{
  String text;
  int textSize= 70;
  int shape = 0;
  int pad=0;
  boolean mousePressedb;
  Button(String t)
  {
    text = t;
  }
  void display( float x, float y)
  {
    fill(255);
    rectMode (CENTER);
      switch(shape)
      {
      case 0:
        rect(x, y, text.length()*textSize+pad, textSize*2);
        break;
      case 1:
        ellipse(x, y-textSize/3, text.length()*textSize+pad, textSize*2);
        break;
      }

    mousePressedb = bOver(x,y,text.length()*textSize+pad);
    fill(0);
    textAlign(CENTER);
    textSize(textSize);
    text(text, x, y+10);
  }
}
boolean bOver( float mx, float my, float msize)
{
  boolean isOver = false;
  if (mousePressed)
  {
    for (int i=0; i < maxTouchEvents; i++)
    {
      if ( mt[i].touched == true && mt[i].busy == false)
      {
        mt[i].busy = true;
        float disX = mx - mt[i].motionX;
        float disY = my - mt[i].motionY;
        if (sqrt(sq(disX) + sq(disY)) <(msize / 2) )
        {
          isOver = true;
        } else {
          //isOver = false;
        }
        mt[i].busy = false;
      }
    }
  }
  return isOver;
}
