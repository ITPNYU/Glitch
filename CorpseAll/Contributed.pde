PImage epler(PImage img) {

  int target_row = ( int ) random( 0, img.height ); 

  for ( int y = target_row; y < img.height; y++ ) {
    for ( int x = 0; x < img.width; x++ ) {
      int pos = y * img.width + x;
      img.pixels[ pos ] = img.pixels[ target_row * img.width + x ];
    }
  }
  img.updatePixels();
  //  img.save("data/glitch-out.jpg");
  //  img = loadImage("glitch-out.jpg");
  return img;
}


PImage mk3981(PImage img) {

  img.loadPixels();

  for (int i=0; i< img.width*img.height; i++) {

    color cur = img.pixels[i];
    int r = int(red(cur));
    int g = int(green(cur));
    int b = int(blue(cur));

    //using the 1-bit music algorithm:

    int off = i*(i>>7|i>>12); // miiro
    off %= 256; // don't let the offset overflow
    // shuffle channels and xor with minimal c data
    if (random(1) < 0.5) {

      img.pixels[i] = color(
      g & off, 
      b & off, 
      r & off);
    }
    else {
      img.pixels[i] = color(
      g ^ off, 
      b ^ off, 
      r ^ off);
    }
  }

  return img;
}

PImage glitchUzzi(PImage img)
{

  for (int i = 0; i < img.pixels.length; i++)
  {
    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);

    r = 255 - r;
    g = 255 - g;
    b = 255 - b;

    img.pixels[i] = color(r, g, b);
  }

  return img;
}

PImage inessah(PImage img) {
  img.save("data/glitch-out.jpg");
  byte raw[] = loadBytes("glitch-out.jpg");
  int i = 11;
  // inessah
  while (! (raw[i] == (byte) 0xff && raw[i+1] == (byte) 0xda) &&
    i < raw.length - 10) {
    i++;
  }
  // modify the remaining bytes
  while (i < raw.length) {
    if (raw[i] == 5) {
      raw[i]++;
      raw[i]+=2;
    }
    i++;
  }
  saveBytes("data/glitch-out.jpg", raw);
  img = loadImage("glitch-out.jpg");
  return img;
}


PImage obr(PImage img) {
  img.save("data/glitch-out.jpg");
  byte raw[] = loadBytes("glitch-out.jpg");
  int i = 0;
  // skip the jpeg header
  while (! (raw[i] == (byte) 0xff && raw[i+1] == (byte) 0xda) &&
    i < raw.length - 1) {
    i++;
  }
  // modify the remaining bytes
  byte rawcopy[] = new byte[raw.length];
  arrayCopy(raw, 0, rawcopy, 0, rawcopy.length);
  rawcopy = sort(rawcopy);
  for (int h=0; h < rawcopy.length-i-h; h++) {
    raw[i+12+h] = (byte) ((rawcopy[h]) - h<<4);
  }


  saveBytes("data/glitch-out.jpg", raw);
  img = loadImage("glitch-out.jpg");
  return img;
}

PImage dsk_bl(PImage img) {
  PImage img2 = loadImage("marylinKM.jpg");
  img2.loadPixels();
  int n = img.width * img.height;
  for (int j = 0; j < n; j++) {
    color cur = img.pixels[j];
    color cur2 = img2.pixels[j];
    int r = int(red(cur)), g = int(green(cur)), b = int(blue(cur));
    int r2 = int(red(cur2)), g2 = int(green(cur2)), b2 = int(blue(cur2));
    if (j%3==0) {
      img.pixels[j] = color(100, r2, g2, b);
    }
    else if (j%4==0) {
      img.pixels[j] = color(150, r, r, r);
    }
    else {
      img.pixels[j] = color(150, r, g, b2);
    }
  }
  return img;
}


PImage chris(PImage img) {
  img.save("data/glitch-out.jpg");
  byte raw[] = loadBytes("glitch-out.jpg");
  int i = 0;
  // skip the jpeg header
  while (! (raw[i] == (byte) 0x1f && raw[i+1] == (byte) 0xd1) &&
    i < raw.length-1) {
    i++;
  }
  // modify the remaining bytes
  while (i < raw.length) {
    if (raw[i] == 4) {
      raw[i]++;
    }
    if (raw[i] == 5 || raw[i] == 10) {
      raw[i] = byte(tan(raw[i]));
    }
    i+=25;
  }
  saveBytes("data/glitch-out.jpg", raw);
  img = loadImage("glitch-out.jpg");
  return img;
}

int offset=1;
PImage aaron1(PImage img) { 
  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur)), g = int(i*(0xaa07+i>>(i>>9&14)&15)), b = int(random(4));
    int off = i*(0xaa07+i>>(i>>9&14)&15); 
    offset=offset*2;
    if (offset>256) {
      offset=4;
    }
    off %= 256;
    img.pixels[i] = color(
    g ^ off, 
    b ^ off, 
    r ^ off);
    if (i%int(random(1, 10))==0) {
      img.pixels[(int)random(n)]=color(i);
    }
  }
  return img;
}
PImage aaron2(PImage img) { 

  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur)), g = int(i*(0xaa07+i>>(i>>9&14)&15)), b = int(random(4));
    int off = i*(0xaa07+i>>(i>>9&14)&15); 
    offset=offset*2;
    if (offset>2000000) {
      offset=4;
    }
    off %= offset;
    img.pixels[i] = color(
    g ^ off, 
    b ^ off, 
    r ^ off);
    if (i%int(random(1, 10))==0) {
      img.pixels[(int)random(n)]=color(i);
    }
  }
  return img;
}
PImage aaron3(PImage img) { 

  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur)), g = int(i*(0xaa07+i>>(i>>9&14)&15)), b = int(random(4));
    int off = i*(0xaa07+i>>(i>>9&14)&15); 
    offset=offset*2;
    if (offset>2000) {
      offset=4;
    }
    off %= offset;
    img.pixels[i] = color(
    g ^ off, 
    b ^ off, 
    r ^ off);
    if (i%int(random(1, 10))==0) {
      img.pixels[(int)random(n)]=color(i);
    }
  }
  return img;
}
PImage aaron4(PImage img) { 

  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur)), g = int(i*(0xaa07+i>>(i>>9&14)&15)), b = int(random(4));
    int off = i*(0xaa07+i>>(i>>9&14)&15); 
    offset=offset*2;
    if (offset>256) {
      offset=4;
    }
    off %= offset;
    img.pixels[i] = color(
    g ^ off, 
    b ^ off, 
    r ^ off);
    if (i%int(random(1, 10))==0) {
      img.pixels[(int)random(n)]=color(i);
    }
  }
  return img;
}

PImage nick(PImage img) {
  img.save("data/glitch-out.jpg");
  byte raw[] = loadBytes("glitch-out.jpg");
  int i = 0;
  while (! (raw[i] == (byte) 0xff && raw[i+1] == (byte) 0xda) &&
    i < raw.length - 1) {
    i++;
  }
  while (i < raw.length) {
    if (raw[i] == 10) {
      //raw[i]++;
      raw[i] =byte(raw[i]>>1);
    }
    if (raw[i] == 100) {
      raw[i] = byte(raw[i]<< 2);
    }
    i++;
  }
  saveBytes("data/glitch-out.jpg", raw);
  img = loadImage("glitch-out.jpg");
  for (int j = 0; j < 280; j++) {
    if (frameCount % 2 == 0) {
      img.copy(img, 0, 0, width-1, height-1, 1, 1, width-1, height-1);
    } 
    else {
      img.copy(img, 1, 1, height-1, width-1, 0, 0, width-1, height-1);
    }
  }
  colorMode(HSB, 255);
  int n = img.width * img.height;
  for (int k=0; k<n; k++) {
    color cur = img.pixels[k];
    int h = int(hue(cur));
    int s = int(saturation(cur));
    int b = int(brightness(cur));
    if (frameCount % 2 == 0) {
      b = int(brightness(cur)) << 1;
    }
    else {
      b = int(brightness(cur)) >> 3;
    }
    img.pixels[k] = color(h, s, b);
  }
  img.updatePixels();
  img.copy(img, 1, 1, width-1, height-1, 0, 0, height-1, width-1);
  image(img, 0, 0, width, height); 
  return img;
}

PImage guilherme(PImage img) {
  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur)), g = int(green(cur)), b = int(blue(cur));
    int off = i*100^(i>>10)|i*3&(i*500>>100); // miiro
    off %= 256; // don't let the offset overflow
    // shuffle channels and xor with minimal c data
    img.pixels[i] = color(r ^ off);
  }
  img.save("glitch-out.jpg");
  return img;
}

PImage yin_0(PImage img) {  
  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur)), g = int(green(cur)), b = int(blue(cur));
    int off = i*((i>>1)>>(i>>12));
    off %= 256; // don't let the offset overflow
    // shuffle channels and xor with minimal c data
    img.pixels[i] = color(
    g ^ off, 
    b ^ off, 
    r ^ off);
  }

  return img;
}

PImage rtb288_0(PImage img) {
  img.save("data/glitch-out.jpg");
  byte raw[] = loadBytes("glitch-out.jpg");
  int j = 0;
  while (! (raw[j] == (byte) 0xff && raw[j+1] == (byte) 0xda) &&
    j < raw.length - 1) {
    j++;
  }
  while (j < raw.length) {
    if (raw[j] == 10) {
      raw[j]++;
    }
    j++;
  }
  saveBytes("data/glitch-out.jpg", raw);
  img = loadImage("glitch-out.jpg");

  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int k = i % 256;
    int r = int(red(cur));
    int g = int(green(cur));
    int b = int(blue(cur));
    int shiftR = int(random(100));
    int shiftG = int(random(100));
    int shiftB = int(random(100));
    int newR = ((int(random(2) * r) << shiftR) >> shiftR * int((r * 3 >> int(sin(r * 1.5))) * r >> 8)) >> 3;
    int newG = ((int(random(2) * g) << shiftG) >> shiftG * int((g * 3 >> int(sin(g * 1.5))) * g >> 8)) >> 3;
    int newB = ((int(random(2) * b) << shiftB) >> shiftB * int((b * 3 >> int(sin(b * 1.5))) * b >> 8)) >> 3;
    img.pixels[i] = color(newR, newG, newB);
    if (i % 20 == 0) {
      img.pixels[i] = img.pixels[int(random(i))];
    }
    if (i % 20 == 2) {
      img.pixels[i] = color(0, 0, 0);
    }
  }
  return img;
}

PImage vt520_1(PImage img) {
  PImage img2 = loadImage("flag.jpg");
  img2.loadPixels();
  int n = img.width * img.height;
  for (int j = 0; j < n; j++) {
    color cur = img.pixels[j];
    color cur2 = img2.pixels[j];
    int r = int(red(cur)), g = int(green(cur)), b = int(blue(cur));
    int off = j*10&(j>>20)|j*3&(j*5>>15); // miiro
    off %= 256; // don't let the offset overflow
    if (j%2==0) {
      img.pixels[j] = color(0, 0, g^off, 0);
    }
    else if (j%3==0 || j%7==0) {
      img.pixels[j] = cur2;
    }
    else {
      img.pixels[n-j-1] = color(r^off, 0, 0);
    }
  }

  //img = loadImage("glitch-out.jpg");
  return img;
}


PImage yin_1(PImage img) {
  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur)), g = int(green(cur)), b = int(blue(cur));
    int off = i*((i>>11)&(i>>12)) ; 
    off %= 256; // don't let the offset overflow
    // shuffle channels and xor with minimal c data
    img.pixels[i] = color(
    g ^ off, 
    b ^ off, 
    r ^ off);
  }
  return img;
}



PImage db2497(PImage img) {
  int n = img.width * img.height;
  for (int i = 0; i < n; i++) {
    color cur = img.pixels[i];
    int r = int(red(cur/height)), g = int(green(cur/width)), b = int(blue(cur*width));
    int off = i/width &( i>>77)|i*i&(i+640>>1000/height); // miiro
    off %= 120; // don't let the offset overflow
    // shuffle channels and xor with minimal c data
    img.pixels[i] = color(
    g/2 ^ off, 
    b/2 ^ off, 
    r/2 ^ off);
  }
  return img;
}


PImage hk_1(PImage img) {
  img.save("data/maryjill.jpg");
  int i = 0;


  byte raw2[] = loadBytes("marylin.jpg");
  // skip the jpeg header
  while (! (raw2[i] == (byte) 0xff && raw2[i+1] == (byte) 0xda) &&
    i < raw2.length - 1) {
    i++;
  }
  // modify the remaining bytes
  while (i < raw2.length) {
    if (raw2[i] == 1) {
      raw2[i]++;
    }
    i++;
  }
  tint(255, 10);

  saveBytes("data/maryjill.jpg", raw2);
  img = loadImage("maryjill.jpg");

  return img;
}


PImage hk_2(PImage img2) {
  img2.save("data/maryjill2.jpg");
  tint(255, 200);
  byte raw[] = loadBytes("jillpenis.jpg");
  int i = 0;
  // skip the jpeg header
  while (! (raw[i] == (byte) 0xff && raw[i+1] == (byte) 0xda) &&
    i < raw.length - 1) {
    i++;
  }
  // modify the remaining bytes
  while (i < raw.length) {
    if (raw[i] == 1) {
      raw[i]++;
    }
    i++;
  }

  saveBytes("data/maryjill2.jpg", raw);
  img = loadImage("maryjill2.jpg");

  return img;
}

