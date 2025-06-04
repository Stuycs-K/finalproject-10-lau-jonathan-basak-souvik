import gifAnimation.*;

int IMG = 0;
int TXT = 1;
int JIF = 2;

int MODE = IMG;
String PLANE = "red";
int LAYER = 0;
String MESSAGE = "";
String DISPLAYMODE = "true";
String INPUTFILENAME = "";
String OUTPUTFILENAME = "";

PImage INPUT;
Gui GUI;

void setup() {
  size(1200,600);
  GUI = new Gui(800, 0, 400, 600, this);
}

void encodeGif() {
  String[] planes = {"red", "green", "blue"};
  PImage[] allFrames;
  try {
    allFrames = Gif.getPImages(this, MESSAGE);
  } catch (NullPointerException e) {
    println("Could not load gif from: " + MESSAGE);
    return;
  }
  PImage MESSAGEIMG;
  for (int i=0; i<9; i++) {
    PLANE = planes[i/3];
    LAYER = i%3;
    if (i<allFrames.length) {
      MESSAGEIMG = allFrames[i * allFrames.length/9];
    } else {
      MESSAGEIMG = createImage(INPUT.width, INPUT.height, RGB);
    }
    MESSAGEIMG = resizeImage(MESSAGEIMG, INPUT.width, INPUT.height);
    blackAndWhite(MESSAGEIMG);
    modifyImage(INPUT, MESSAGEIMG.pixels);
  }
  INPUT.save("data/"+OUTPUTFILENAME);
  println("Encoded gif saved to: " + OUTPUTFILENAME);
}

void encodeImage() {
  PImage MESSAGEIMG;
  if (MODE == IMG) {
    MESSAGEIMG = loadImage(MESSAGE);
    if (MESSAGEIMG == null) {
      println("Could not load message image from: " + MESSAGE);
      return;
    }
  }
  else {
    MESSAGEIMG = messageToPicture(MESSAGE, INPUT.width, INPUT.height);
  }
  MESSAGEIMG = resizeImage(MESSAGEIMG, INPUT.width, INPUT.height);
  blackAndWhite(MESSAGEIMG);
  modifyImage(INPUT, MESSAGEIMG.pixels);
  INPUT.save("data/"+OUTPUTFILENAME);
  println("Encoded image saved to: " + OUTPUTFILENAME);
}

PImage extractImage(PImage img, String plane, int layer) {
  PImage output = createImage(img.width, img.height, RGB);
  for (int i=0; i<img.pixels.length; i++) {
    int bit = 0;
    if (plane.equals("red")) {
      bit = ((int) red(img.pixels[i])) & ~(255 & ~(1 << layer));
    } else if (plane.equals("green")) {
      bit = ((int) green(img.pixels[i])) & ~(255 & ~(1 << layer));
    } else {
      bit = ((int) blue(img.pixels[i])) & ~(255 & ~(1 << layer));
    }
    if (bit == 0) {
      output.pixels[i] = color(255, 255, 255);
    } else {
      output.pixels[i] = color(0, 0, 0);
    }
  }
  output.updatePixels();
  return output;
}

GifMaker extractGif(PImage img) {
  String[] planes =  {"red", "green", "blue"};
  GifMaker gifExport = new GifMaker(this, "data/"+OUTPUTFILENAME);
  gifExport.setRepeat(0);
  for (int i=0; i<9; i++) {
    String plane = planes[i/3];
    int layer = i%3;
    gifExport.addFrame(extractImage(img, plane, layer));
    gifExport.setDelay(200);
  }
  return gifExport;
}

void draw() {
  if (DISPLAYMODE.equals("true")) {
    background(50);
    if (INPUT != null && GUI.exportSwitch.CURRENTVAL.equals("ENCODE")) {
      image(INPUT, 0, 0, 800, 600);
    }
    GUI.draw();
  }
}

void mousePressed() {
  if (GUI != null) {
    GUI.mousePressed();
  }
}

void keyPressed() {
  if (GUI != null) {
    GUI.keyPressed();
  }
}

void modifyImage(PImage img, int[] imagePixels) {
  img.loadPixels();
  for (int i=0; i<imagePixels.length; i++) {
    int c = img.pixels[i];
    if (PLANE.equals("red")) {
      int newRed = ((int) red(img.pixels[i])) & ~(1 << LAYER) | ((~imagePixels[i] & 1) << LAYER);
      img.pixels[i] = color(newRed, green(c), blue(c));
    } 
    else if (PLANE.equals("green")) {
      int newGreen = ((int) green(img.pixels[i])) & ~(1 << LAYER) | ((~imagePixels[i] & 1) << LAYER);
      img.pixels[i] = color(red(c), newGreen, blue(c));
    } 
    else if (PLANE.equals("blue")) {
      int newBlue = ((int) blue(img.pixels[i])) & ~(1 << LAYER) | ((~imagePixels[i] & 1) << LAYER);
      img.pixels[i] = color(red(c), green(c), newBlue);
    }
  }
  img.updatePixels();
}

PImage resizeImage(PImage img, int targetWidth, int targetHeight) {
  PImage newImage = createImage(targetWidth, targetHeight, RGB);
  newImage.loadPixels();
  newImage.copy(img, 0, 0, img.width, img.height, 0, 0, targetWidth, targetHeight);
  newImage.updatePixels();
  return newImage;
}

void blackAndWhite(PImage img) {
  for (int i=0; i<img.pixels.length; i++) {
    float red = red(img.pixels[i]);
    float green = green(img.pixels[i]);
    float blue = blue(img.pixels[i]);
    if ((red+green+blue) / 3 < 128) {
      img.pixels[i] = color(0, 0, 0);
    } 
    else {
      img.pixels[i] = color(255, 255, 255);
    }
  }
  img.updatePixels();
}

PImage messageToPicture(String message, int w, int h) {
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
  pg.background(0);
  pg.textSize(50); 
  pg.text(message, 0, h/2);
  pg.endDraw();
  return pg.get();
}
