# Stegsolve Encoder/Decoder for Image/Text/Gif

## Overview
This project involves steganography, a method of hiding data through forms of media like images, sound, video, etc. Specifically, our project involves **image steganography**, where data is hidden in a PNG image (PNG is used because it is lossless).

We use Least Significant Bit (LSB) steganography to hide the image within the color channels of each pixel.

![image](https://github.com/user-attachments/assets/5054b928-50b2-40bb-be05-15350b1640e8)

## Encoding
For image mode, we take an input file as a cover image, a file of the image we want to hide, and a file to save the stego-image as. When we encode an image, we first resize the image to match that of the cover image (which may result in some distortions). Due to the limited number of bits we can actually hide, the image must be converted into a black and white image.

<img width="1088" alt="Rick turns black" src="https://github.com/user-attachments/assets/ec0542bf-d37a-41ae-b712-3ce21607a18f" />

For text mode, we want the text to be displayed as an image, so we draw the text into a PGraphics object, which is basically a sketch buffer, save that PGraphics render as an image, and do the same process as done for images.

<img width="495" alt="Screenshot 2025-06-03 at 10 51 16 PM" src="https://github.com/user-attachments/assets/f7e50247-4008-4a43-b4fb-6682a6c89e60" />

For GIFs, things are slightly different. Due to lossy conversions with video files, we have to export an encoded gif as a lossless PNG file. So, we store 9 frames of the gif into the red, green, and blue planes in layers 0-2. While the gif is ever so slightly more visible than an encoded image, it's still not easily seen.

![encode](https://github.com/user-attachments/assets/598ade31-102e-4c45-ae80-246034def583)

The encoded gif >:)
![ricky](https://github.com/user-attachments/assets/6c026f29-bf49-408d-b4bc-d061d01408f1)
