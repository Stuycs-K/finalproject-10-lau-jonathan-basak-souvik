# Dev Log:

This document must be updated daily every time you finish a work session.

## Jonathan Lau 

### 2025-05-15 - Starting out the stego
Testing out how reading gifs and images will work in Processing (works similarly to images), implementing library (specifically to assist with reading gifs since they aren't naturally supported).

50 min

### 2025-05-16 - Gif stego (its a bit weird!)
The GifAnimation library is rather conventional, but exporting the gif file is a little strange. Gif format only supports the RGB channels, but the alpha channel **CAN** be chosen using a method. I'm not entirely sure if this will cause problems later on. Otherwise, just more testing with the library, since this GifMaker class is the only way we can export the gif out.

```
GifMaker gifExport = new GifMaker(PApplet parent, String filename, int quality, int transparentColor);
```

[GifAnimation library](https://github.com/extrapixel/gif-animation)

40 min

### 2025-05-17 - More gif stego
We are starting the skeleton today. Well, we already started it a little bit earlier, but today marks the definite day in the devlog. 
Args, using GifMaker, it's all here.

45 min

### 2025-05-18 - Base Skeleton
As the name suggests, we are continuing working on the skeleton of the code, but we've already begun the encoding methods. Since gif format can be converted into an array of images, this process is quite easy and simple. We are likely to tackle GREEDY first, since that's the easiest and we also have past code for it.

40 min

### 2025-05-19 - Greedy Encode
As yesterday mentioned, we are working on GREEDY encode today, which should be just an implementation of the GREEDY encode from the original assignment it was in. The issue more likely lies in parsing the new args, since that's a whole slurry of code I don't want to deal with right now.

1hr 10min

### 2025-05-20 - Culmination
Did pair programming with Souvik and remembered that I needed to do the devlog! Oops. Attempting to fork code for Processing gui and gif modification, but otherwise building off yesterday's work.

40 min

### 2025-05-21 - More encoding
Trying to determine which encoding methods to use for the gif encoder (GREEDY, SELECTIVE), but keeping in mind how we will decode it.

50min

### 2025-05-22 - Decode...
Souvik's working on decode while I work on the encoding methods. Progress is going fine, though I'm having very little time to work on this project due to AP week. 

40 min

### 2025-05-23 - Even more encoding
Basically adding onto 2025-05-21's and 2025-05-22's work. Nothing really is new, though so I can't elaborate on this devlog much further.

1hr

### 2025-05-24 - Kernels?
Messing around with kernels to see if I can implement them as a unique encoding method. I'll have each character of the message be mapped to a 2x4 kernel in this format:

```
[0,0,0,0]
[0,0,0,0]
```

Each character will represent their ascii value turned into binary (from top left to bottom right) and the kernel will not wrap around.
I need to do more research on whether the kernel transformation will be lossless.

[Matrix Convolutions](https://docs.gimp.org/2.8/en/plug-in-convmatrix.html)

50min

### 2025-05-25 - Unforseen mishaps
GIF format is lossy (even though compression is lossless) so we'll need to adjust our code to work for a stegsolve encoder/decoder instead. The code (sorta?) transfers over, so it'll be fine I think? If you are reading this Mr. K, I hope that you are understanding that we needed to do a 180 degree turn on our project.

45min

### 2025-05-26 - Gotta go fast
  We are creating the base code for the stegsolve encoder, and keeping it simple since we got to work fast. If we have enough time, we can perhaps add more encoding methods, but a basic skeleton is always good. 
  
40min

### 2025-05-27 - Applying Text
Pair programming with Souvik. Entailed figuring out how to encode the text into the input image. Here's how we did it. Create a black picture with text as the base, then use LSB with the black and white version of the input. Now the image has the encoded text in it. Though, 

50min

### 2025-05-28 - MessageImg
More pair programming with Souvik. Today we worked on fixing the command line arguments on the terminal. I also needed to fix processing the messageImg since there wasn't a method created for that yet, but that was quite easy to fix at home.

1hr 20min

### 2025-05-29 - Fixing The Args
Args should be all fixed, but some of the naming conventions for the variables are just plain strange. Removing unnecessary and confusing code (old comments, etc.), as well as extensive testing of the makefile and different encodings (maybe code a stegsolve method within the program?).

1hr 30min

### 2025-05-30 - GUI: Fancy Textbox
I'm working on the GUI now. This likely means that the GUI will be used instead of the command line, but we'll see where that takes us. 
Today I worked on creating the Textbox class, which was more of a pain than I thought. I wanted to make it look nice, so I added an insertion point and made sure the text couldn't overflow to the right or left of the text box. (proper text scrolling)

1hr 30min

### 2025-05-31 - GUI: Switches and Buttons
Implemented the Button superclass and Switch subclass (inheritance!). They work as they should, but I'm aware I may Tneed to deactivate buttons/switches depending on the mode. Trying to make the classes as easily malleable as possible, because I know I'll need to accomodate specific changes to our program if they come.

2hr

### 2025-06-01 - GUI: Finished!
Needed to add code catching errors, as well as designing the GUI class, the full implementation of the Textbox, Switch and Button classes into a functional GUI. Basically entailed a lot of changing values so everything looks just right. Maybe will add an "error console" within the GUI that is created if any parameters create an error case. Starting to think that the GUI will overtake the makefile/terminal method of running the program, since the parseArgs method is taking up a lot of space and is cluttering otherwise clean code.

2hr

### 2025-06-02 - Reimplementing GIF encoding method: It returns!
Guess what, we're readding the GIF encoding method from the original conception of the project. It'll only be a 9 frame gif (any gif with more frames will be condensed into nine frames) encoded into the rgb channels of a singular photo. Neat right? This is not lossy, and we can utilize that GifMaker class that we've been so eager on using. Hurray! Tomorrow, lets do stegsolve. (since I still have a bunch of the GUI space left)

1hr

### 2025-06-03 - The Final Day
Time to lock in. Completely added and finished stegsolve, added gif functionality and added some minor flourishes to the GUI. StegoJam is now at version 2.01 which is nice. Fixed a LOT of bugs with Souvik. Terminal line args completely removed in favor of GUI, and I believe that this was for the best. We are finally free.

3hr
