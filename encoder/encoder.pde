import gifAnimation.*;

Gif animation;
PImage[] allFrames;

void setup() {
  size(600,600);
  animation = new Gif(this, "rickroll-roll.gif");
  allFrames = Gif.getPImages(this, "rickroll-roll.gif");
  animation.play();
}

void draw() {
  image(allFrames[0], 0, 0);
}
