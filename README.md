[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/am3xLbu5)
# 
 
### The Jellyfish Jammers

Jonathan Lau + Souvik Basak
       
### Project Description:

Stegsolve encoder and decoder with text/img/gif functionality

This program is intended to encode a text message, image, or gif into an image's rgb planes while also having the ability to decode (by shifting through these planes). The gif will not have the "shift planes" functionality since the gif is encoded into all of the rgb channels of the image.

### Instructions:

Required libraries: GifAnimation

## How It Works

How a message, image or gif is encoded into the respective image is different. For the message, the message is converted into a PGraphics render (so as to properly place the text into an image), then that image with the message is encoded into the given plane (least significant bit) of the input image. The input image will need to be changed into black and white in order to encode the black and white text image into it. How an image is encoded into another image is similar; its just that we no longer need to use a PGraphics render to create the image since we already have the image! As for the gif, there is less freedom because we need to utilize every single channel of the input image. We set the standard to be nine frames because that's the three least significant bits for the red, green and blue channels. Any higher, and parts of
the gif begin to show in the image we are trying to encode. If we ignored this restriction, the max amount of frames for the gif is twenty four. 

As for the decoding process, stegsolve for the image and message is the same; you are cycling through the planes of the encoded image until you find the hidden image/message. That's pretty standard. However, for the gif, we need to extract each individual image from each of the lower rgb channels (0-2), then use the GifMaker class to join together these images into a whole gif! This conversion is lossy, but this doesn't matter since we aren't using the image to obsfuscate data anymore. As a consequence of how the gif is encoded into the image, the gif will be in black and white.

## How to Use The Program

### Encoding
Begin by running the program in Processing. You'll see a GUI and a black screen, showing that you haven't inputted an image yet. The program will **NOT** encode or decode anything if you put in any invalid arguments into the GUI. (10 as a plane number, attempting to use a png in gif encoding, etc.) In order to encode anything, first make sure that the ENCODE/DECODE switch is set to **ENCODE**. Next, type in your input filename in the INPUT FILE textbox (the file you are encoding) and then your output filename in the OUTPUT FILE textbox. The next step will be dependent on what encoding mode you switch to.

If you chose **MESSAGE**, then you need to input a string of characters (quotations aren't necessary). If you chose **IMAGE**, you need to input filename (or path for a filename) for an image. If you chose **GIF**, you'll notice some of the boxes are now redded out. You can no longer type in these boxes since gif encoding works much differently than the other encoding modes. Still, input the filename for a gif that the program can access.

For **MESSAGE** or **IMAGE** encoding, you can choose what color channel and what plane of that channel to encode the message/img into. However, for **GIF**, you don't need to do any of that because every gif is encoded the same way. Your final step is to click the **APPLY** button in order to encode the input image using your chosen encoding method. 

The encoded image will now be displayed to the left of the GUI, and now we can move on to our next step: **Decoding**.

### Decoding 
Now that you have your encoded image, lets extract the goods! First click the ENCODE/DECODE switch to **DECODE**. This should lock everything except the MODE, input and output. If you want to extract text, click the switch until it reads **TEXT**, and I think you know how this works for the other modes. 

If you've extracted a gif, pressing **APPLY** should show the gif if you've put in the correct parameters. However, if you've encoded a message or image into the input image, you'll now need to use our built in stegsolve and move through the color planes to find your hidden prize! If you remember what color and plane you encoded to, this should be easy.

## Who Did What?

Souvik: main encoding methods + gif functionality (encode/decode)

Jonathan: stegsolve + graphical interface + some extra encoding

### Resources/ References:
Imported Library: GifAnimation [source code](https://github.com/extrapixel/gif-animation)

Links Observed (not utilized): [Kernels](https://docs.gimp.org/2.8/en/plug-in-convmatrix.html)

[Presentation](https://drive.google.com/drive/u/0/folders/17qx8HXwiSukRT50jA3MYGXDo_amH-uux)

