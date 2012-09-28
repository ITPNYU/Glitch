PImage img, mod, down;
PFont font;

void setup() {
  img = loadImage("bee.jpg");
  down = loadImage("bee.jpg");
  mod = loadImage("bee.jpg");
  size(img.width * 2, img.height);
  font = createFont("Helvetica", 16);
  textFont(font, 16);
  textAlign(LEFT, TOP);
}

void draw() {
  int n = img.width * img.height;
  int amt = int(constrain(map(mouseX, 0, width, 1, 16), 1, 16));
  
  arraycopy(img.pixels, down.pixels);
  down.resize(img.width / amt, img.height / amt);
  down.resize(img.width, img.height);
  
  colorMode(HSB, 255);
  for (int i = 0; i < n; i++) {
    color high = img.pixels[i];
    color low = down.pixels[i];
    float hh = hue(high), hs = saturation(high), hb = brightness(high);
    float lh = hue(low), ls = saturation(low), lb = brightness(low);
//    mod.pixels[i] = color(hh, hs, hb); // original
//    mod.pixels[i] = color(lh, hs, hb); // just hue
//    mod.pixels[i] = color(hh, ls, hb); // just sat
    mod.pixels[i] = color(lh, ls, hb); // hue and sat
//    mod.pixels[i] = color(hh, hs, lb); // just bri
  }
  mod.updatePixels();
  
  image(img, 0, 0);
  if(mousePressed) {
    image(down, img.width, 0);
  } else {
    image(mod, img.width, 0);
  }
  text(amt, 10, 10);
}

