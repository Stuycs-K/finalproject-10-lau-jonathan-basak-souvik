import gifAnimation.*;
import java.util.Arrays;

final static int GREEDY = 0;
final static int REDLAST2 = -196609;

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
  get number of bytes of data
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

void encodeMessage(byte[] messageArray) {
  int bytesPerFrame = (int) (Math.ceil(messageArray.length / allFrames.length));
  int bytesEncoded = 0;
  int frame = 0;
  
  while (bytesEncoded < messageArray.length) {
    int start = bytesPerFrame * frame;
    int end  = Math.min(messageArray.length, start + bytesPerFrame);
    modifyImage(allFrames[frame], Arrays.copyOfRange(messageArray, start, end));
    bytesEncoded += bytesPerFrame;
    frame++;
  }
}

void modifyImage(PImage img, byte[] messageSegment) {
  img.loadPixels();
  if (MODE == GREEDY) {
    
    for (int i=0; i<messageSegment.length + 4; i++) {
      //setting last 2 bits of red
      img.pixels[i] &= REDLAST2;
      if (i < messageSegment.length) {
        img.pixels[i] |= messageSegment[i] << 16;
      } else {
        img.pixels[i] |= 3 << 16;
      }
    }
    
  }
  img.updatePixels();
}

byte[] readMessage(){
  if (MODE == GREEDY) {
    return PLAINTEXT.getBytes();
  }
  return null;
}
