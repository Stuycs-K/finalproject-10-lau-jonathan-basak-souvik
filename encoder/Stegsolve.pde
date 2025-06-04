class Stegsolve extends Button {
  /* 
  When using stegsolve, we need to have the ability to cycle through every plane. 
  This consists of:
    The original encoded image (0)
    red 0-7 (1-8)
    green 0-7 (9-16)
    blue 0-7 (17-24)
  This is a total of 25 planes.
  */
  PImage encodedImg;
  PImage cycleImg; // change the cycleImg every time currChannel changes
  int currChannel = 0; // we always start with the original encoded photo
  Button channelLeft, channelRight;
  String[] planeNames; // Store names for each plane
  
  Stegsolve(int x, int y, int w, int h) {
    super(x, y, w, h);
    channelLeft = new Button(x - 800, y + 550, w, h);
    channelRight = new Button(x - 150, y + 550, w, h);
    
    planeNames = new String[25];
    planeNames[0] = "Original Image";
    
    // Red planes (1-8)
    for (int i = 0; i < 8; i++) {
      planeNames[i + 1] = "Red Plane " + i;
    }
    
    // Green planes (9-16) 
    for (int i = 0; i < 8; i++) {
      planeNames[i + 9] = "Green Plane " + i;
    }
    
    // Blue planes (17-24)
    for (int i = 0; i < 8; i++) {
      planeNames[i + 17] = "Blue Plane " + i;
    }
  }
  
  void draw() {
    // Only show stegsolve controls when in decode mode and not GIF mode
    if (MODE == IMG || MODE == TXT)
      channelLeft.draw("◄");
      channelRight.draw("►");
      
      // Display current plane information
      fill(255);
      textSize(16);
      textAlign(LEFT, TOP);
      text("Plane: " + planeNames[currChannel], 10, 10);
      text("Channel: " + currChannel + "/24", 10, 30);
      textSize(12);
      
      // Update and display the current plane image
      if (INPUT != null) {
        updateCycle();
        if (cycleImg != null) {
          image(cycleImg, 0, 0, 800, 600);
        }
      }
    }
  
  void updateCycle() {
    if (INPUT == null) {
      return;
    }
    
    if (currChannel == 0) {
      // Show original image
      cycleImg = INPUT.copy();
    } else if (currChannel >= 1 && currChannel <= 8) {
      // Red planes (layers 0-7)
      int layer = currChannel - 1;
      cycleImg = extractPlane(INPUT, "red", layer);
    } else if (currChannel >= 9 && currChannel <= 16) {
      // Green planes (layers 0-7)
      int layer = currChannel - 9;
      cycleImg = extractPlane(INPUT, "green", layer);
    } else if (currChannel >= 17 && currChannel <= 24) {
      // Blue planes (layers 0-7)
      int layer = currChannel - 17;
      cycleImg = extractPlane(INPUT, "blue", layer);
    }
  }
  
  PImage extractPlane(PImage img, String colorPlane, int bitLayer) {
    PImage output = createImage(img.width, img.height, RGB);
    output.loadPixels();
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      int pixelValue = img.pixels[i];
      int channelValue = 0;
      
      if (colorPlane.equals("red")) {
        channelValue = (pixelValue >> 16) & 0xFF;
      } 
      else if (colorPlane.equals("green")) {
        channelValue = (pixelValue >> 8) & 0xFF;
      } 
      else if (colorPlane.equals("blue")) {
        channelValue = pixelValue & 0xFF;
      }
      
      int bitValue = (channelValue >> bitLayer) & 1;
      
      // Convert bit to grayscale (0 = black, 1 = white)
      int grayValue = bitValue * 255;
      output.pixels[i] = color(grayValue, grayValue, grayValue);
    }
    
    output.updatePixels();
    return output;
  }
  
  void mousePressed() {
    // Only handle mouse presses when stegsolve is active
    if (MODE == IMG || MODE == TXT) {
      if (channelLeft.IsValidZone()) {
        prevChannel();
      } 
      else if (channelRight.IsValidZone()) {
        nextChannel();
      }
    }
  }
  
  void nextChannel() {
    currChannel = (currChannel + 1) % 25;
    updateCycle();
  }
  
  void prevChannel() {
    currChannel = (currChannel + 24) % 25;
    updateCycle();
  }
  
  void keyPressed() {
    // Only handle keys when stegsolve is active
    if (MODE == IMG || MODE == TXT) {
      if (keyCode == RIGHT) {
        nextChannel();
      } 
      else if (keyCode == LEFT) {
        prevChannel();
      }
    }
  }
  
  // Reset to original image when switching modes
  void reset() {
    currChannel = 0;
    cycleImg = null;
  }
}
