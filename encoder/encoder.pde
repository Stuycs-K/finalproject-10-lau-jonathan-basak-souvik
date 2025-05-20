import gifAnimation.*;

Gif animation;

void setup() {
  size(600,600);
  animation = new Gif(this, "rickroll-roll.gif");
  animation.play();
}

void draw() {
  image(animation, 0, 0);
}
