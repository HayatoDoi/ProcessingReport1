PImage img; //Original image
PImage img_g; //Changed image

void setup()
{
  size(1000, 640);
  frameRate(30);
  img = loadImage("food.jpg");
  img.loadPixels();
  loadPixels();
  
  
  img_g = createImage(img.width, img.height, RGB);

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float g;
      g = green (img.pixels[loc]);
      
      color c = color(0, g, 0);
      img_g.pixels[loc] = c;
    }
  }
}

void draw() 
{
  image(img_g, 0, 0, img_g.width, img_g.height);
}