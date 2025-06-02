class Button {
  int x, y, w, h;

  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  boolean IsValidZone() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }

  void draw(String name) {
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
    text(name, x + w / 2, y + h / 2);
  }
}
