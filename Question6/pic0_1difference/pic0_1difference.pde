import gab.opencv.*;
OpenCV opencv;
PImage  pic0, pic1, grayDiff;

void setup()
{
  size(1000, 640);
  pic0 = loadImage("pic0.jpg");
  pic1 = loadImage("pic1.jpg");
  opencv = new OpenCV(this, pic0);
  opencv.diff(pic1);
  grayDiff = opencv.getSnapshot();
}

void draw()
{
  image(grayDiff, 0, 0);
}