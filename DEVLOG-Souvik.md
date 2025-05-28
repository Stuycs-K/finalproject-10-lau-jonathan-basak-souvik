# Dev Log:

This document must be updated daily every time you finish a work session.

## Souvik Basak

### 2025-05-15: 

### 2025-05-20:
Imported gif animation library and tested loading gifs and image arrays.

### 2025-05-26: Stegosaurus
Wrote an algorithm for hiding an image within another to be revealed by stegsolve. It converts the secret image into black-and-white and hides it in the specified bit plane of the original image. I also made it work with GIFs, however due to how GIFs handle colors, it's only really effective when using a bit plane of 5 or higher, so possibly won't include it.

### 2025-05-27: Cleanup
Due to the way the GIF library works, encoding messages in bytes does not work, as GIFs are not lossless. So we are moving to steganography; we already have an image steganography function set up, and have plans for the user encoding text as well.
