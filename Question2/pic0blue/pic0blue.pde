PImage img; //Original image
PImage img_b; //Changed image

int[] hist = new int[256];
int histMax = max(hist);

void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("food.jpg");
  img.loadPixels();
  loadPixels();
  
  
  img_b = createImage(img.width, img.height, RGB);

  for (int x = 0; x < img.width; x++)
  {
    for (int y = 0; y < img.height; y++ )
    {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float b;
      b = blue (img.pixels[loc]);
      
      color c = color(0, 0, b);
      img_b.pixels[loc] = c;
    }
  }
  for (int i = 0; i < img_b.width; i++)
  {
    for (int j = 0; j < img_b.height; j++) 
    {
      int loc = i + j*img_b.width;
      float b;
      b = blue (img_b.pixels[loc]);
      hist[(int)(b)]++;
    }
  }
  histMax = max(hist);
}

void draw() 
{
  image(img, 0, 0, img.width/2, img.height/2);
  
  image(img_b, img.width/2, 0, img_b.width/2, img_b.height/2);

  stroke(160, 216, 239, 128);
  pushMatrix();
  translate(img.width/2, img.height/2);
  scale(0.5);
  for (int i = 0; i < img_b.width; i += 2) 
  {
    int which = int(map(i, 0, img_b.width, 0, 255));
    int y = int(map(hist[which], 0, histMax, img_b.height, 0));
    line(i, img_b.height, i, y);
  }
  popMatrix();
}