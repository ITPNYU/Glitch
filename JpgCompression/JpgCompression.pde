PImage img;

void setup() {
  img = loadImage("bee-in.jpg");
  size(img.width, img.height);
  //frameRate(4);
}

void draw() {
  if(frameCount % 2 == 0) {
    img.copy(img, 0, 0, width-1, height-1, 1, 1, width-1, height-1);
  } else {
    img.copy(img, 1, 1, width-1, height-1, 0, 0, width-1, height-1);
  }
  //img.resize(int(img.width * 1.01), int(img.height * 1.01));
  if(frameCount % 2 == 0) {
    img.save("data/bee-out.gif");
    img = loadImage("data/bee-out.gif");
  } else {
    img.save("data/bee-out.jpg");
    img = loadImage("data/bee-out.jpg");
  }
  image(img, 0, 0, width, height);
}
