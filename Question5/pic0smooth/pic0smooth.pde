/**
 * References
 * 
 */

PImage img; //Original image
PImage img_gray; //Changed image
PImage img_smooth;
void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("pic0.jpg");
  img.loadPixels();
  loadPixels();
  
  img_gray = createImage(img.width, img.height, RGB);
  img_smooth = createImage(img.width, img.height, RGB);

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
  for (int y = 1; y < img_gray.height-1; y++)
  { 
    for (int x = 1; x < img_gray.width-1; x++)
    {
      float dx, dy, norm; 
      dx = red(img_gray.get(x+1,y  )) - red(img_gray.get(x,y));
      dy = red(img_gray.get(x  ,y+1)) - red(img_gray.get(x,y));
      norm = sqrt(dx*dx + dy*dy);
      img_smooth.set(x, y, color(norm));
    } 
  }
}

void draw() 
{
  image(img_smooth, 0, 0, img_smooth.width, img_smooth.height);
}