PImage img; //Original image
PImage img_g; //Changed image

int[] hist = new int[256];
int histMax = max(hist);

void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("food.jpg");
  img.loadPixels();
  loadPixels();
  
  
  img_g = createImage(img.width, img.height, RGB);

  for (int x = 0; x < img.width; x++)
  {
    for (int y = 0; y < img.height; y++ )
    {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float g;
      g = green (img.pixels[loc]);
      
      color c = color(0, g, 0);
      img_g.pixels[loc] = c;
    }
  }
  for (int i = 0; i < img_g.width; i++)
  {
    for (int j = 0; j < img_g.height; j++) 
    {
      int loc = i + j*img_g.width;
      float g;
      g = green (img_g.pixels[loc]);
      hist[(int)(g)]++;
    }
  }
  histMax = max(hist);
}

void draw() 
{
  image(img, 0, 0, img.width/2, img.height/2);
  
  image(img_g, img.width/2, 0, img_g.width/2, img_g.height/2);

  stroke(255, 255, 0, 128);
  pushMatrix();
  translate(img.width/2, img.height/2);
  scale(0.5);
  for (int i = 0; i < img_g.width; i += 2) 
  {
    int which = int(map(i, 0, img_g.width, 0, 255));
    int y = int(map(hist[which], 0, histMax, img_g.height, 0));
    line(i, img_g.height, i, y);
  }
  popMatrix();
}