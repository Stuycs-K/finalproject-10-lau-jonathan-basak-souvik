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

### 2025-05-17 - 

45 min

### 2025-05-18 - 

40 min

### 2025-05-19 -

### 2025-05-20 - Culmination
Did pair programming with Souvik and remembered that I needed to do the devlog! Oops. Will fix from now on. Attempting to fork code for processing gui and gif modification. 

40 min

### 2025-05-21 -

### 2025-05-22 - 

### 2025-05-23 - Greedy Encode
Greedy encoding completed, greedy decoding about done.

1hr

### 2025-05-24 - Kernels?
Messing around with kernels 

[Matrix Convolutions](https://docs.gimp.org/2.8/en/plug-in-convmatrix.html)

50min

### 2025-05-25 - Unforseen mishaps
GIF format is lossy (even though compression is lossless) so we'll need to adjust our code to work for a stegsolve encoder/decoder instead. The code (sorta?) transfers over, so it'll be fine I think? If you are reading this Mr. K, I hope that you are understanding on the fact we needed to do a 180 degree turn on our project!

45min

### 2025-05-26
  We are creating the base code for the stegsolve encoder, and keeping it simple since we got to work fast. If we have enough time, we can perhaps add more encoding methods, but a basic skeleton is always good. 
  
40min

### 2025-05-27 - 
Pair programming with Souvik. 

50min

### 2025-05-28 -
More pair programming with Souvik. Today we worked on . I needed to fix processing the messageImg since there wasn't a method created for that yet, but that was rather simple to fix at home.

1hr

### 2025-05-29 - Fixing The Args


1hr 30min

