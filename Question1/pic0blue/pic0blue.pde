PImage img; //Original image
PImage img_b; //Changed image

void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("pic0.jpg");
  img.loadPixels();
  loadPixels();
  
  
  img_b = createImage(img.width, img.height, RGB);

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float b;
      b = red (img.pixels[loc]);
      
      color c = color(0, 0, b);
      img_b.pixels[loc] = c;
    }
  }
}

void draw() 
{
  image(img_b, 0, 0, img_b.width, img_b.height);
}
