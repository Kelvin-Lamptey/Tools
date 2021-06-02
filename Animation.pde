
class Animation
{
  PImage[] images;
  int imageCount;
  int frame;
  boolean stop = false;
  boolean mloop;
  Animation(String imagePrefix, int count,boolean loop)
  {
    mloop = loop;
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++)
    {
      String filename = imagePrefix + nf(i, 1) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void showImage(float xpos, float ypos)
  {
    image(images[0],xpos,ypos);
  }

  void display(float xpos, float ypos)
  {
    frame = (frame+1) % imageCount;
    if ( stop == false)
    {
      image(images[frame], xpos-(images[frame].width/2), ypos-(images[frame].height/2));
    }
    if ( frame == 0)
    {
      stop = !mloop;
    }
  }

  int getWidth()
  {
    return images[0].width;
  }
  float getHeight()
  {
    return images[0].height;
  }
}