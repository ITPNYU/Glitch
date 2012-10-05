byte raw[] = loadBytes("bee-in.jpg");
boolean inHeader = true;
for(int i = 0; i < raw.length - 1; i++) {
  if(raw[i] == (byte) 0xff && raw[i+1] == (byte) 0xda) {
    inHeader = false;
  }
  if(!inHeader) {
    if(raw[i] > 'a' && raw[i] < 'e') {
      raw[i]++;
    } 
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
