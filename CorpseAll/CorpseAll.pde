int side = 512;
int count = 4;

PGraphics pg;
PImage img;
PFont font;

String[] all = {
  "kcm304_0",
  "kcm304_1",
  "kcm304_2",
  "kcm304_3",
  "kcm304_4",
  "kcm304_5",
  "kcm304_6",
  
  "epler",
  "mk3981",
  "glitchUzzi",
  "inessah",
  "obr",
  "dsk_bl",
  "chris",
  "aaron1",
  "aaron2",
  "aaron3",
  "aaron4",
  "nick",
  "guilherme",
  "yin_0",
  "yin_1",
  "rtb288_0",
  "vt520_1",
  "db2497",
  "hk_1",
  "hk_2"
};

PImage pick(PImage img, int choice) {
  try {
    switch(choice) {
      case 0: return kcm304_0(img);
      case 1: return kcm304_1(img);
      case 2: return kcm304_2(img);
      case 3: return kcm304_3(img);
      case 4: return kcm304_4(img);
      case 5: return kcm304_5(img);
      case 6: return kcm304_6(img);
      
      case 7: return epler(img);
      case 8: return mk3981(img);
      case 9: return glitchUzzi(img);
      case 10: return inessah(img);
      case 11: return obr(img);
      case 12: return dsk_bl(img);
      case 13: return chris(img);
      case 14: return aaron1(img);
      case 15: return aaron2(img);
      case 16: return aaron3(img);
      case 17: return aaron4(img);
      case 18: return nick(img);
      case 19: return guilherme(img);
      case 20: return yin_0(img);
      case 21: return yin_1(img);
      case 22: return rtb288_0(img);
      case 23: return vt520_1(img);
      case 24: return db2497(img);
      //case 25: return hk_1(img);
      case 26: return hk_2(img);
      
      default: return img;
    }
  } catch(Exception e) {
    return img;
  }
}

void setup() {
  size(512, 512, JAVA2D);
  //img = loadImage("lena.png");
  img = loadImage("mandrill.png");
  //img = loadImage("bytebeat.png");
  //img = loadImage("marylin.jpg");
  pg = createGraphics(side * count, side * count, JAVA2D);
  pg.beginDraw();
  int i = 0;
  for(int y = 0; y < count; y++) {
    for(int x = 0; x < count; x++) {
      img.loadPixels();
      //int choice = int(random(27));
      int choice = int(random(7, 27));
      println("processing with " + all[choice]);
      img = pick(img, choice);
      img.updatePixels();
      pg.image(img, x * side, y * side);
      pg.text(all[choice], x * side, y * side);
    }
  }
  pg.endDraw();
  pg.save("final-pass.tiff");
  println();
  
  font = createFont("Helvetica", 32);
  textFont(font, 32);
}

void draw() {
  background(0);
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
