PImage  img1, img2, diff;
boolean ARRAY_COMPARE = true; // using simple array compare (true) or built in blend difference mode (false)

void settings() {
  img1 = loadImage("first.png");
  img2 = loadImage("second.png");
   
  size(img1.width, img1.height);
}

void setup() {  
  
  if (ARRAY_COMPARE){
    int index = 0;
    img1.loadPixels();
    img2.loadPixels();
    
    loadPixels();
    for (int i = 0; i < img1.height; i++) {
    for (int j = 0; j < img2.width; j++) {
      index = i * img1.width + j;
      
      if (img1.pixels[index] - img2.pixels[index] != 0) {
        pixels[index] = color(0);
      }
      else{
        pixels[index] = color(255);
      }      
    }
    }
    updatePixels();
  }
  else{    
    image(img1, 0, 0);
    blend(img2, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
    
    // to test threshold
    //float m = map(mouseX, 0, width, 0, 1);
    //println(m);
    
    filter(THRESHOLD, 0.007);
    filter(INVERT);
  }
}