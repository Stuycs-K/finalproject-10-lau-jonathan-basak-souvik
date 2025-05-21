import gifAnimation.*;
final static int GREEDY = 0;


int MODE = GREEDY;
String PLAINTEXT = "This";
String DISPLAYMODE = "true";
String INPUTFILENAME="rickroll-roll.gif";

Gif animation;
PImage[] allFrames;

void setup() {
  size(1200,600);
  animation = new Gif(this, "rickroll-roll.gif");
  allFrames = Gif.getPImages(this, "rickroll-roll.gif");
  animation.play();
  /*encode:
  split message data among the frames
  stick each chunk of message data into each frame, have way to mark end of encoded bytes
  
  decode:
  read until marked end
  combine read data from each frame
  profit
  */
}

void draw() {
  image(animation, 0, 0);
}
