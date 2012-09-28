byte raw[] = loadBytes("bee-in.jpg");
for(int i = 0x03f4e; i < raw.length; i++) {
  if(raw[i] > 'a' && raw[i] < 'e') {
    raw[i]++;
  }
}
/*
Serial serial;
for(int i = 0x03f4e; i < raw.length; i++) {
  serial.write(raw[i]);
  raw[i] = serial.read();
}
*/
saveBytes("data/bee-out.jpg", raw);
PImage img = loadImage("bee-out.jpg");
if(img.width > 0 && img.height > 0) {
  size(img.width, img.height);
  image(img, 0, 0);
} else {
  println("fail");
}
