PImage img, mod;
PFont font;

void setup() {
  img = loadImage("bee.jpg");
  mod = loadImage("bee.jpg");
  size(img.width * 2, img.height);
  font = createFont("Helvetica", 16);
  textFont(font, 16);
  textAlign(LEFT, TOP);
}

void draw() {
  int n = img.width * img.height;
  int hs = 0, ss = 0, bs = 0;
  bs = int(constrain(map(mouseX, 0, width, 0, 8), 0, 8));
  colorMode(HSB, 255);
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int h = (int(hue(cur)) >> hs) << hs;
    int s = (int(saturation(cur)) >> ss) << ss;
    int b = (int(brightness(cur)) >> bs) << bs;
    mod.pixels[i] = color(h, s, b);
  }
  mod.updatePixels();
  
  image(img, 0, 0);
  image(mod, img.width, 0);
  text(hs + "/" + ss + "/" + bs, 10, 10);
}

