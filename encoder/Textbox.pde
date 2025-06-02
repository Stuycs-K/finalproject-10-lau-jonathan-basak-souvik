class Textbox {
  int x, y, w, h;
  String TXT = "";
  boolean ACTIVE = false;
  boolean SHOWINSERTION = true;
  int INSERTIONTIMER = 0;
  int PADDING = 5;

  Textbox(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

  }

  void update() {
    INSERTIONTIMER++;
    if (INSERTIONTIMER > 30) { //timer for the insertion point blink (0.5s)
      SHOWINSERTION = !SHOWINSERTION;
      INSERTIONTIMER = 0;
    }
  }

  void draw() {
    stroke(0);
    fill(255);
    rect(x, y, w, h, 5); 

    fill(0);
    textAlign(LEFT, CENTER);

    String visibleText = getVisibleText();
    float textX = x + PADDING;
    float textY = y + h / 2;
    text(visibleText, textX, textY);
    
    if (ACTIVE && SHOWINSERTION) { //The actual blink for the insertion point
      float cursorX = textX + textWidth(visibleText);
      float cursorY1 = y + PADDING;
      float cursorY2 = y + h - PADDING;
      stroke(0);
      line(cursorX, cursorY1, cursorX, cursorY2);
    }
  }

  String getVisibleText() { //Makes sure the text doesn't overflow from the text box
    float maxWidth = w - 2 * PADDING;
    int len = TXT.length();
    for (int i = 0; i <= len; i++) {
      String sub = TXT.substring(i);
      if (textWidth(sub) <= maxWidth) {
        return sub;
      }
    }
    return "";
  }

  void mousePressed() {
    ACTIVE = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }

  void keyPressed() {
    if (ACTIVE) {
      if (key == BACKSPACE && TXT.length() > 0) {
        TXT = TXT.substring(0, TXT.length() - 1);
      } 
      else if (key == ENTER || key == RETURN) {
        ACTIVE = false;
      }
      else if (key != CODED && key != BACKSPACE) {
        TXT += key;
      }
    }
  }
}
