int IMG = 0;
int TXT = 1;

int MODE = IMG;
String PLANE = "red";
int LAYER = 0;
String MESSAGE = "myeyes.gif";
String DISPLAYMODE = "true";
String INPUTFILENAME = "";
String OUTPUTFILENAME = "";

void setup() {
  size(1000,800);
  //if (args == null) {
  //  println("no arguments provided");
  //  println("flags: -i INPUTFILENAME -o OUTPUTFILENAME -e MESSAGE (text or filename depending on mode) -d DISPLAYMODE (true/false) -m MODE (IMAGE/TEXT) -p PLANE (red/green/blue) -l LAYER(0-7)");
  //  return;
  //}
  
  //if (!parseArgs()) {
  //  println("Parsing argument error;");
  //  return;
  //}
  
  //Testing saving text as file and deleting
  background(0);
  textSize(50);
  text("jellyfish jammers", 450, 350);
  save("jelly.png");
  File f = new File("jelly.png");
  if (f.exists()) {
    f.delete();
  }
}

void draw() {
  //exit();
  //return;
}

void modifyImage(PImage img, int[] imagePixels) {
  img.loadPixels();
    //messageSegment is the black and white pixels to hide
  for (int i=0; i<imagePixels.length; i++) {
    int c = img.pixels[i];
    if (PLANE.equals("red")) {
      int newRed = ((int) red(img.pixels[i])) & ~(1 << LAYER) | ((~imagePixels[i] & 1) << LAYER);
      img.pixels[i] = color(newRed, green(c), blue(c));
    } else if (PLANE.equals("green")) {
      int newGreen = ((int) green(img.pixels[i])) & ~(1 << LAYER) | ((~imagePixels[i] & 1) << LAYER);
      img.pixels[i] = color(red(c), newGreen, blue(c));
    } else if (PLANE.equals("blue")) {
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
    } else {
      img.pixels[i] = color(255, 255, 255);
    }
  }
  img.updatePixels();
}

PImage messageToPicture(String message) { 
  background(0); 
  textSize(50); 
  text(message, 450, 350); 
  PImage image = get(); 
  return image; 
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

      if(args[i].equals("-e")){
        try{
          MESSAGE=args[i+1];
        }catch(Exception e){
          println("-e requires quoted plaintext as next argument");
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
          if(modeString.equalsIgnoreCase("image")){
            MODE = IMG;
          } else if (modeString.equalsIgnoreCase("text")) {
            MODE = TXT;
          } else {
            println("Invalid mode choice, defaulting to Image");
            MODE = IMG;
          }

        } else{
          println("-m requires mode as next argument");
          return false;
        }
      }
      
      if (args[i].equals("-p")) {
        if (args[i+1] != null) {
          String modeString = args[i+1];
          if (modeString.equalsIgnoreCase("red") || modeString.equalsIgnoreCase("green") || modeString.equalsIgnoreCase("blue")) {
            PLANE = modeString.toLowerCase();
          } else {
            println("Invalid plane choice, defaulting to red");
            PLANE = "red";
          }
        } else {
          println("-p requires plane as next argument");
          return false;
        }
      }
      
      if (args[i].equals("-l")) {
        if (args[i+1] != null) {
          try {
            LAYER = Integer.parseInt(args[i+1]);
          } catch (NumberFormatException e) {
            println("-l requires integer as next argument");
            return false;
          }
        } else {
          println("-l requires integer as next argument");
          return false;
        }
      }
    }
  }
  return true;
}
