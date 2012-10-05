int side = 512;
int count = 4;

PGraphics pg;
PImage img;

PImage pick(PImage img) {
  int choice = int(random(7));
  print(nf(choice, 2) + " ");
  switch(choice) {
    case 0: return kcm304_0(img);
    case 1: return kcm304_1(img);
    case 2: return kcm304_2(img);
    case 3: return kcm304_3(img);
    case 4: return kcm304_4(img);
    case 5: return kcm304_5(img);
    case 6: return kcm304_6(img);
  }
  return img;
}

void setup() {
  size(512, 512, JAVA2D);
  img = loadImage("marylin.jpg");  
  pg = createGraphics(side * count, side * count, JAVA2D);
  pg.beginDraw();
  background(0);
  for(int i = 0; i < count*count; i++) {
    print("xx ");
  }
  println();
  for(int y = 0; y < count; y++) {
    for(int x = 0; x < count; x++) {
      img.loadPixels();
      img = pick(img);
      img.updatePixels();
      pg.image(img, x * side, y * side);
    }
  }
  pg.endDraw();
  println();
}

void draw() {
  if(mousePressed) {
    mouseX = constrain(mouseX, 0, width);
    mouseY = constrain(mouseY, 0, height);
    translate(mouseX, mouseY);
    scale(count, count);
    translate(-mouseX, -mouseY);
  }
  image(pg, 0, 0, width, height);
}

void keyPressed() {
  if(key == ' ') {
    setup();
  }
}
