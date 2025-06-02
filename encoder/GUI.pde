class Gui { //The gui is composed of several things.
  /*
    1) Input Filename (needs to exist in the data folder before running)
    2a) Encoding mode (IMG/TEXT switch)
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
  Switch modeSwitch, planeSwitch;
  Button applyEncode;
  
  Gui(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    inputFile = new Textbox(x + 20, y + 30, 200, 30);
    outputFile = new Textbox(x + 20, y + 80, 200, 30);
    inputBox = new Textbox(x + 20, y + 130, 200, 30);
    layerBox = new Textbox(x + 20, y + 180, 60, 30);

    modeSwitch = new Switch(x + 250, y + 30, 100, 30, new String[]{"TXT", "IMG"});
    planeSwitch = new Switch(x + 250, y + 80, 100, 30, new String[]{"red", "green", "blue"});

    applyEncode = new Button(x + 250, y + 130, 120, 50); //this can be reworked into a encode/decode switch if we end up adding the stegsolve here
  }
  
  void draw() {
    fill(220);
    rect(x, y, w, h, 10);
    
    fill(0);
    textAlign(LEFT, CENTER);
    text("INPUT FILE", x+20, y+20);
    text("OUTPUT FILE", x+20, y+70);
    text("MESSAGE/IMG INPUT", x+20, y+120);
    text("LAYER (0-7)", x+20, y+170);
    
    text("ENCODING MODE", x+250, y+20);
    text("PLANE COLOR", x+250, y+70);
    
    textSize(30);
    text("STEGOJAM© V1.1", x+20, y+240);
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
    applyEncode.draw("ENCODE"); 
  }
  
  void mousePressed() {
    inputFile.mousePressed();
    outputFile.mousePressed();
    layerBox.mousePressed();
    inputBox.mousePressed();
    
    if (modeSwitch.IsValidZone()) {
      modeSwitch.nextVal();
    }
    else if (planeSwitch.IsValidZone()) {
      planeSwitch.nextVal();
    }
    else if (applyEncode.IsValidZone()) {
      INPUTFILENAME = inputFile.TXT;
      OUTPUTFILENAME = outputFile.TXT;
      MESSAGE = inputBox.TXT;
      PLANE = planeSwitch.CURRENTVAL;
      MODE = modeSwitch.CURRENTVAL.equals("IMG") ? IMG : TXT;
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
