PImage img;

void setup() {
  size(512, 512, JAVA2D);
  img = loadImage("marylin.jpg");
  img.loadPixels();
  img = glitch(img);
  img.updatePixels();
  image(img, 0, 0);
}

PImage glitch(PImage img) {
  img.save("data/glitch-out.jpg");
  byte raw[] = loadBytes("glitch-out.jpg");
  int i = 0;
  // skip the jpeg header
  while (!(raw[i] == (byte) 0xff && raw[i+1] == (byte) 0xda) &&
      i < raw.length - 1) {
    i++;
  }
  // modify the remaining bytes
  while(i < raw.length) {
    if(raw[i] == 10) {
      raw[i]++;
    }
    i++;
  }
  saveBytes("data/glitch-out.jpg", raw);
  img = loadImage("glitch-out.jpg");
  return img;
}

