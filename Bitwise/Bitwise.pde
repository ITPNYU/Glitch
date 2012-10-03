void setup() {
  size(256, 256);
  noSmooth();
  strokeWeight(2);
}

void draw() {
  background(0);
  translate(0, height);
  scale(1, -1);
  int bs = (int) map(mouseX, 0, width, 0, 8);
  for(int i = 0; i < 256; i++) {
    // white is original data
    stroke(255);
    point(i, i);
    
    // red is right shift
    stroke(255, 0, 0);
    point(i, i >> bs);
    
    // blue is right shift followed by left shift (aka mask the 4 high bits)
    stroke(0, 255, 0);
    point(i, (i >> bs) << bs);
    
    // green is left shift followed by mask of the 8 least significant bits 
    stroke(0, 0, 255);
    point(i, (i << bs) & 0xff);
    
    // magenta is a 4 bit mask of the least significant bits 
    stroke(255, 0, 255);
    point(i, i & 0x0f);
  }
}
