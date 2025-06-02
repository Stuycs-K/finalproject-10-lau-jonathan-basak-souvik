class Switch extends Button {
  String[] VALUES;
  String CURRENTVAL;
  int CURRENTINDEX;
  
  Switch(int x, int y, int w, int h, String[] values) {
    super(x,y,w,h);
    this.VALUES = values;
    this.CURRENTINDEX = 0;
    this.CURRENTVAL = values[0];
  }
  
  void nextVal() {
    CURRENTINDEX = (CURRENTINDEX + 1) % VALUES.length;
    CURRENTVAL = VALUES[CURRENTINDEX];
  }
  
  void draw() {
    if (IsValidZone() && mousePressed) {
      fill(200);
    }
    else {
      fill(180);
    }
    stroke(0);
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    text(CURRENTVAL, x + w / 2, y + h / 2);
  }
  
}
