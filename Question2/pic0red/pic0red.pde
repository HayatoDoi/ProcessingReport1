PImage img; //Original image
PImage img_r; //Changed image

int[] hist = new int[256];
int histMax = max(hist);

void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("food.jpg");
  img.loadPixels();
  loadPixels();
  
  
  img_r = createImage(img.width, img.height, RGB);

  for (int x = 0; x < img.width; x++)
  {
    for (int y = 0; y < img.height; y++ )
    {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r;
      r = red (img.pixels[loc]);
      
      color c = color(r, 0, 0);
      img_r.pixels[loc] = c;
    }
  }
  for (int i = 0; i < img_r.width; i++)
  {
    for (int j = 0; j < img_r.height; j++) 
    {
      //int bright = int(brightness(get(i, j)));
      
      int loc = i + j*img_r.width;
      
      float r;
      r = red (img_r.pixels[loc]);
      hist[(int)(r)]++;
  
    }
  }
  histMax = max(hist);
}

void draw() 
{
  image(img, 0, 0, img.width/2, img.height/2);
  
  image(img_r, img.width/2, 0, img_r.width/2, img_r.height/2);

  stroke(255, 255, 255, 128);
  pushMatrix();
  translate(img.width/2, img.height/2);
  scale(0.5);
  for (int i = 0; i < img_r.width; i += 2) 
  {
    int which = int(map(i, 0, img_r.width, 0, 255));
    int y = int(map(hist[which], 0, histMax, img_r.height, 0));
    line(i, img_r.height, i, y);
  }
  popMatrix();
}