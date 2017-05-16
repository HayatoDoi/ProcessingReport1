PImage img; //Original image
PImage img_r; //Changed image

void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("pic0.jpg");
  img.loadPixels();
  loadPixels();
  
  
  img_r = createImage(img.width, img.height, RGB);

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r;
      r = red (img.pixels[loc]);
      
      color c = color(r, 0, 0);
      img_r.pixels[loc] = c;
    }
  }
}

void draw() 
{
  image(img_r, 0, 0, img_r.width, img_r.height);
}
