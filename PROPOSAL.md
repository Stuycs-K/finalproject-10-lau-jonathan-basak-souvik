# Final Project Proposal

## Group Members:

Jonathan Lau
Souvik Basak

# Intentions:

Stegsolve encoder and decoder with text/img/gif functionality
    
# Intended usage:

This program is intended to encode a text message, image, or gif into an image's rgb planes while also having the ability to decode (by shifting through these planes). The gif will not have the "shift planes" functionality since the gif is encoded into all the planes of the image (9 frame gif max because otherwise you begin to start seeing the image). 
  
# Technical Details:

How a message, image or gif is encoded into the respective image is different. For the message, the message is converted into a PGraphics render (so as to properly place the text into an image), then that image with the message is encoded into the given plane (significant bit) of the input image. The input image will need to be changed into black and white in order to encode the black and white text image into it. How an image is encoded into another image is similar; its just that we no longer need to use a PGraphics render to create the image since we already have the image! As for the gif, there is less freedom because we need to utilize every single channel of the input image. We set the standard to be nine frames because that's the three least significant bits for the red, green and blue channels. Any higher, and the parts of 

As for the decoding process, stegsolve for the image and message is the same; you are cycling through the planes of the encoded image until you find the hidden image/message. That's pretty standard. However, for the gif, we need to extract each individual image from each of the lower rgb channels (0-2), then use the GifMaker class to join together these images into a whole gif! This conversion is lossy, but this doesn't matter since we aren't using the image to obsfuscate data anymore. As a consequence of the encoding method, the gif will be in black and white.

Souvik: main encoding methods + gif functionality 

Jonathan: stegsolve + graphical interface + some extra encoding
    
# Intended pacing:

