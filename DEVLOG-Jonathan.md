# Dev Log:

This document must be updated daily every time you finish a work session.

## Jonathan Lau 

### 2025-05-15 - Starting out the stego
Testing out how reading gifs and images will work in Processing (works similarly to images), implementing library (specifically to assist with reading gifs since they aren't naturally supported).

50 min

### 2025-05-16 - Gif stego (its a bit weird!)
The GifAnimation library is rather conventional, but exporting the gif file is a little strange. Gif format only supports the RGB channels, but the alpha channel **CAN** be selected. I'm not entirely sure if this will cause problems later on. Otherwise, just more testing with the library, since this GifMaker class is the only way we can export the gif out.

```
GifMaker gifExport = new GifMaker(PApplet parent, String filename, int quality, int transparentColor);
```

[GifAnimation library](https://github.com/extrapixel/gif-animation)

40 min

### 2025-05-17 - More gif stego
Started with the skeleton
45 min

### 2025-05-18 - Base Skeleton
As the name suggests, we are continuing working on the skeleton of the code, but we've already begun the encoding methods. Since gif format can be converted into an array of images, this process is quite easy and simple. We are likely to tackle GREEDY first, since that's the easiest and we also have past code for it.
40 min

### 2025-05-19 - Greedy Encode

1hr 10min

### 2025-05-20 - Culmination
Did pair programming with Souvik and remembered that I needed to do the devlog! Oops. Attempting to fork code for Processing gui and gif modification, but otherwise building off yesterday's work.

40 min

### 2025-05-21 - More encoding
Trying to choose the encoding methods to use for the gif encoder (GREEDY, SELECTIVE), but keeping in mind how we will decode it.
50min

### 2025-05-22 - Greedy Decode

40 min
### 2025-05-23 - Even more encoding

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
GIF format is lossy (even though compression is lossless) so we'll need to adjust our code to work for a stegsolve encoder/decoder instead. The code (sorta?) transfers over, so it'll be fine I think? If you are reading this Mr. K, I hope that you are understanding that we needed to do a 180 degree turn on our project!

45min

### 2025-05-26 - Gotta go fast
  We are creating the base code for the stegsolve encoder, and keeping it simple since we got to work fast. If we have enough time, we can perhaps add more encoding methods, but a basic skeleton is always good. 
  
40min

### 2025-05-27 - Applying Text
Pair programming with Souvik. Entailed

50min

### 2025-05-28 - MessageImg
More pair programming with Souvik. Today we worked on fixing the command line arguments on the terminal. I also needed to fix processing the messageImg since there wasn't a method created for that yet, but that was quite easy to fix at home.

1hr 20min

### 2025-05-29 - Fixing The Args
Args should be all fixed, but some of the naming conventions for the variables are just plain strange. Removing unnecessary and confusing code (old comments, etc.), as well as extensive testing of the makefile and different encodings (maybe code a stegsolve method within the program?).

1hr 30min

### 2025-05-30

### 2025-05-31

2hr

### 2025-06-01

2hr

