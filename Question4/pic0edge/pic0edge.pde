/**
 * References
 * 
 */

PImage img; //Original image
PImage img_gray; //Changed image
PImage img_mask;
void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("pic0.jpg");
  img.loadPixels();
  loadPixels();
  
  img_gray = createImage(img.width, img.height, RGB);
  img_mask = createImage(img.width, img.height, RGB);

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
  edge(img_gray, img_mask);
}

void draw() 
{
  image(img_mask, 0, 0, img_mask.width, img_mask.height);
}

void edge(PImage input, PImage output)
{
  float gvs;
  float ghs;
  float g;
  // Edge detection
  for (int y = 1; y < input.height-1; y++)
  { 
    for (int x = 1; x < input.width-1; x++)
    {
      // Convolution calculation
      ghs = - red(input.get(x-1, y-1)) - 2*red(input.get(x-1, y)) - red(input.get(x-1, y+1)) + red(input.get(x+1, y-1)) + 2*red(input.get(x+1, y)) + red(input.get(x+1, y+1));
      gvs = - red(input.get(x-1, y-1)) - 2*red(input.get(x, y-1)) - red(input.get(x+1, y-1)) + red(input.get(x-1, y+1)) + 2*red(input.get(x, y+1)) + red(input.get(x+1, y+1));
      g = sqrt(pow(ghs, 2) + pow(gvs, 2));
      // Set pixel value of output image
      output.set(x, y, color(abs(g)));
    }
  }
}