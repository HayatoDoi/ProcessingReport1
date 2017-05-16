/**
 * References
 * http://www.pronowa.com/room/imaging003.html
 */
PImage img; //Original image
PImage img_gray; //Changed image

void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("pic0.jpg");
  img.loadPixels();
  loadPixels();
  
  img_gray = createImage(img.width, img.height, RGB);

  for (int x = 0; x < img.width; x++)
  {
    for (int y = 0; y < img.height; y++ )
    {
      int pos = x + y*img.width;
      color c = img.pixels[pos];
      float r,b,g,gray;
      r = red(c);
      g = green(c);
      b = blue(c);
      gray = 0.3 * r + 0.59 * g + 0.11 * b;
      img_gray.pixels[pos] = color(gray);
    }
  }
}

void draw() 
{
  image(img_gray, 0, 0, img_gray.width, img_gray.height);
}