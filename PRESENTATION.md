# Stegsolve Encoder/Decoder for Image/Text/Gif

## Overview
This project involves steganography, a method of hiding data through forms of media like images, sound, video, etc. Specifically, our project involves **image steganography**, where data is hidden in a PNG image (PNG is used because it is lossless).

We use Least Significant Bit (LSB) steganography to hide the image within the color channels of each pixel.

![image](https://github.com/user-attachments/assets/5054b928-50b2-40bb-be05-15350b1640e8)

## Encoding
For image mode, we take an input file as a cover image, a file of the image we want to hide, and a file to save the stego-image as. When we encode an image, we first resize the image to match that of the cover image (which may result in some distortions). Due to the limited number of bits we can actually hide, the image must be converted into a black and white image.

<img width="1088" alt="Rick turns black" src="https://github.com/user-attachments/assets/ec0542bf-d37a-41ae-b712-3ce21607a18f" />

For text mode, we want the text to be displayed as an image, so we draw the text into a PGraphics object, which is basically a sketch buffer, save that PGraphics render as an image, and do the same process as done for images.
