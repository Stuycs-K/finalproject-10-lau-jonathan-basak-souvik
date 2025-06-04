class Gui { //The gui is composed of several things.
  /*
    1) Input Filename (needs to exist in the data folder before running)
    2a) Encoding mode (IMG/TEXT switch) SOUVIK IF YOU'RE READING THIS, THEN YOU CAN ADD GIF HERE, I MADE THE SYSTEM VERY EASY TO UNDERSTAND
    2b) If IMG (image textbox)
    2c) If TXT (message textbox)
    3) Output Filename (name)
    4) Planes: RGB (red/blue/green switch)
    5) Plane number (0-7 textbox)
    6) Apply encode Button
    OPTIONAL: ADD STEGSOLVE
  */
  int x, y, w, h;
  Textbox inputFile, outputFile, layerBox, inputBox; 
  Switch modeSwitch, planeSwitch, exportSwitch;
  Button apply;
  //used for displaying images and gif from the GUI class
  PApplet parent;
  PImage decodedImage;
  Gif animation;
  
  Gui(int x, int y, int w, int h, PApplet parent) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.parent = parent;
    
    //Textbox
    inputFile = new Textbox(x + 20, y + 30, 200, 30);
    outputFile = new Textbox(x + 20, y + 80, 200, 30);
    inputBox = new Textbox(x + 20, y + 130, 200, 30);
    layerBox = new Textbox(x + 20, y + 180, 60, 30);
    
    //Switch
    modeSwitch = new Switch(x + 250, y + 30, 100, 30, new String[]{"TEXT", "IMAGE", "GIF"});
    planeSwitch = new Switch(x + 250, y + 80, 100, 30, new String[]{"red", "green", "blue"});
    exportSwitch = new Switch(x + 250, y + 130, 100, 30, new String[]{"ENCODE", "DECODE"});
    
    //Button
    apply = new Button(x + 250, y + 180, 120, 50); //this can be reworked into a encode/decode switch if we end up adding the stegsolve here
    
  }
  
  void draw() {
    fill(220);
    rect(x, y, w, h, 10);
    
    fill(0);
    textAlign(LEFT, CENTER);
    text("INPUT FILE", x+20, y+20);
    text("OUTPUT FILE", x+20, y+70);
    text("MESSAGE/IMG/GIF INPUT", x+20, y+120);
    text("LAYER (0-7)", x+20, y+170);
    
    text("ENCODING MODE", x+250, y+20);
    text("PLANE COLOR", x+250, y+70);
    
    textSize(30);
    text("STEGOJAM© V2.0", x+20, y+240);
    textSize(12);
    
    inputFile.draw();
    outputFile.draw();
    layerBox.draw();
    inputBox.draw();
    
    inputFile.update(); //This is to update the indication point
    outputFile.update();
    layerBox.update();
    inputBox.update();
    
    modeSwitch.draw();
    planeSwitch.draw();
    exportSwitch.draw();
    apply.draw("APPLY");
    
    if (animation != null) {
      image(animation, 0, 0, 800, 600);
    }
  }
  
  void mousePressed() {
    inputFile.mousePressed();
    outputFile.mousePressed();
    layerBox.mousePressed();
    inputBox.mousePressed();
    
    if (modeSwitch.IsValidZone()) {
      modeSwitch.nextVal();
      if (modeSwitch.CURRENTVAL.equals("TEXT")) {
        MODE = TXT;
        planeSwitch.ACTIVE = true;
        layerBox.USABLE = true;
      } else if (modeSwitch.CURRENTVAL.equals("GIF")) {
        MODE = JIF;
        planeSwitch.ACTIVE = false;
        layerBox.USABLE = false;
      } else {
        MODE = IMG;
        planeSwitch.ACTIVE = true;
        layerBox.USABLE = true;
      }
    }
    else if (planeSwitch.IsValidZone() && planeSwitch.ACTIVE) {
      planeSwitch.nextVal();
    } else if (exportSwitch.IsValidZone()) {
      exportSwitch.nextVal();
      if (exportSwitch.CURRENTVAL.equals("ENCODE")) {
        inputBox.USABLE = true;
      } else {
        inputBox.USABLE = false;
      }
    }
    else if (apply.IsValidZone()) { //basically check for error limbo
    
      INPUTFILENAME = inputFile.TXT;
      OUTPUTFILENAME = outputFile.TXT;
      MESSAGE = inputBox.TXT;
      PLANE = planeSwitch.CURRENTVAL;
      
      if (MODE != JIF) {
        try {
          LAYER = Integer.parseInt(layerBox.TXT);
          if (LAYER < 0 || LAYER > 7) {
            throw new NumberFormatException();
          }
        } 
        catch (NumberFormatException e) {
          println("Invalid layer value. Must be between 0 and 7.");
          return;
        }
      }

      if (INPUTFILENAME.equals("") || OUTPUTFILENAME.equals("") || (MESSAGE.equals("") && exportSwitch.CURRENTVAL.equals("ENCODE"))) {
        println("One or more required fields are empty.");
        return;
      }

      INPUT = loadImage(INPUTFILENAME);
      if (INPUT == null) {
        println("Could not load input file: " + INPUTFILENAME);
        return;
      }
      
      if (exportSwitch.CURRENTVAL.equals("ENCODE")) {
        if (MODE == JIF) {
          encodeGif();
          println("encoding gif");
        } else {
          encodeImage();
        }
        
      } else {
        decodedImage = null;
        animation = null;
        if (MODE == IMG || MODE == TXT) {
          //Edit this since we're doing arrows for stegsolve
          decodedImage = extractImage(INPUT, PLANE, LAYER);
          decodedImage.save("data/"+OUTPUTFILENAME);
        } else {
          GifMaker gif = extractGif(INPUT);
          gif.finish();
          animation = new Gif(parent, OUTPUTFILENAME);
          animation.play();
        }
      }
      
    }
  }
  
  void keyPressed() {
    if (inputFile.ACTIVE) {
      inputFile.keyPressed();
    }
    else if (outputFile.ACTIVE) {
      outputFile.keyPressed();
    }
    else if (inputBox.ACTIVE) {
      inputBox.keyPressed();
    }
    else if (layerBox.ACTIVE) {
      layerBox.keyPressed();
    }
  }
}
