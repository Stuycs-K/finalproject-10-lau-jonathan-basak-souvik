import java.util.Arrays;

final static int GREEDY = 0;
final static int STEGO = 3;
final static int REDLAST2 = -196609;

int MODE = STEGO;
String PLANE = "red";
int LAYER = 0;
String PLAINTEXT = "myeyes.gif";
String DISPLAYMODE = "true";
String INPUTFILENAME = "rickroll-roll.gif";
String OUTPUTFILENAME = "rickroll-encoded.gif";

void setup() {
  size(1000,800);
  //if (args == null) {
  //  println("no arguments provided");
  //  println("flags: -i INPUTFILENAME -o OUTPUTFILENAME -p PLAINTEXT (text or filename depending on mode) -d DISPLAYMODE (true/false) -m MODE (GREEDY/SELECTIVE/FILE)");
  //  return;
  //}
  
  //if (!parseArgs()) {
  //  println("Parsing argument error;");
  //  return;
  //}
  
  
  
  
  
}

void draw() {
  //exit();
  //return;
}

void modifyImage(PImage img, int[] messageSegment) {
  img.loadPixels();
  if (MODE == STEGO) {
    //messageSegment is the black and white pixels to hide
    for (int i=0; i<messageSegment.length; i++) {
      int c = img.pixels[i];
      if (PLANE.equals("red")) {
        int newRed = ((int) red(img.pixels[i])) & ~(1 << LAYER) | ((~messageSegment[i] & 1) << LAYER);
        img.pixels[i] = color(newRed, green(c), blue(c));
      } else if (PLANE.equals("green")) {
        int newGreen = ((int) green(img.pixels[i])) & ~(1 << LAYER) | ((~messageSegment[i] & 1) << LAYER);
        img.pixels[i] = color(red(c), newGreen, blue(c));
      } else if (PLANE.equals("blue")) {
        int newBlue = ((int) blue(img.pixels[i])) & ~(1 << LAYER) | ((~messageSegment[i] & 1) << LAYER);
        img.pixels[i] = color(red(c), green(c), newBlue);
      }
    }
  }
  img.updatePixels();
}

int[] readMessage(){
  
  return null;
}

//Only works well for padding an image
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
    } else {
      img.pixels[i] = color(255, 255, 255);
    }
  }
  img.updatePixels();
}

boolean parseArgs(){
  if (args != null) {
    for (int i = 0; i < args.length; i++){
      if(args[i].equals("-i")){
        try{
          INPUTFILENAME=args[i+1];
        }catch(Exception e){
          println("-o requires filename as next argument");
          return false;
        }
      }

      if(args[i].equals("-p")){
        try{
          PLAINTEXT=args[i+1];
        }catch(Exception e){
          println("-p requires quoted plaintext as next argument");
          return false;
        }
      }

      if(args[i].equals("-o")){
        if(args[i+1]!=null){
          OUTPUTFILENAME=args[i+1];
        }else{
          println("-o requires filename as next argument");
          return false;
        }
      }

      if(args[i].equals("-d")){
        if(args[i+1]!=null){
          DISPLAYMODE=args[i+1];
        }else{
          println("-d requires true/false as next argument");
          return false;
        }
      }

      if(args[i].equals("-m")){
        if(args[i+1]!=null){
          String modeString=args[i+1];
          if(modeString.equalsIgnoreCase("greedy")){
            MODE = GREEDY;
          }else if(modeString.equalsIgnoreCase("selective")){
            //MODE = SELECTIVE;
          }else if(modeString.equalsIgnoreCase("file")){
            //MODE = FILE;
          }else if(modeString.equalsIgnoreCase("stego")){
            MODE = STEGO;
          }
          else{
            println("Invalid mode choice, defaulting to Greedy");
            MODE = GREEDY;
          }

        }else{
          println("-m requires mode as next argument");
          return false;
        }
      }
    }
  }
  return true;
}
