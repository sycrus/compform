/* 
 References:
   weighted greyscale: https://medium.com/@delightful_Kdub/image-manipulation-with-processing3-c52ec08bbf27
   converting greyscale to int: https://processing.org/discourse/beta/num_1159135995.html
   10 levels of grey: http://paulbourke.net/dataformats/asciiart/ 
*/

char[] ascii = {' ', '.', ':', '-', '=', '+', '*', '#', '%', '@'};

void setup() {
  PImage img = loadImage("fatcat.jpg");
  
  PFont font = createFont("Courier", 10);
  int fontSize = 10;
  
  background(0);
  
  size(800, 800);
  
  img.loadPixels();
  String textOutput[] = new String[img.height];
  for (int y = 0 ; y < img.height; y++) {
    textOutput[y] =""; //initialize string to prevent null
  }
  for (int y = 0 ; y < img.height; y++) {
    for (int x = 0 ; x < img.width; x++) {
      //for greyscale image
      //color c = img.pixels[y * img.width + x];
      //float r = red(c);
      //float g = green(c);
      //float b = blue(c);
      //color grey = color(0.21 * r + 0.72 * g + 0.07 * b); //weighted grayscale
      
      int c=img.pixels[y * img.width + x]; // 
      int r=(c&0x00FF0000)>>16; // red part
      int g=(c&0x0000FF00)>>8; // green part
      int b=(c&0x000000FF); // blue part
      int grey= int(0.21 * r + 0.72 * g + 0.07 * b);
      int mgrey = int(map(grey, 0, 255, 0, 100));
      
      textOutput[y] = textOutput[y] + ascii[0];
      if (mgrey > 0 && mgrey < 10) {
        textOutput[y] = textOutput[y] + ascii[0];
      } 
      else if (mgrey > 9 && mgrey < 20) {
        textOutput[y] = textOutput[y] + ascii[1];
      }
      else if (mgrey > 19 && mgrey < 30) {
        textOutput[y] = textOutput[y] + ascii[2];
      }
      else if (mgrey > 29 && mgrey < 40) {
        textOutput[y] = textOutput[y] + ascii[3];
      }
      else if (mgrey > 39 && mgrey < 50) {
        textOutput[y] = textOutput[y] + ascii[4];
      }
      else if (mgrey > 49 && mgrey < 60) {
        textOutput[y] = textOutput[y] + ascii[5];
      }
      else if (mgrey > 59 && mgrey < 70) {
        textOutput[y] = textOutput[y] + ascii[6];
      }
      else if (mgrey > 69 && mgrey < 80) {
        textOutput[y]= textOutput[y] + ascii[7];
      }
      else if (mgrey > 79 && mgrey < 90) {
        textOutput[y] = textOutput[y] + ascii[8];
      }
      else if (mgrey > 89 && mgrey < 101) {
        textOutput[y] = textOutput[y] + ascii[9];
      }
    }
  }
  fill (255);
  //image(img, 0 , 0);
  for (int y = 0 ; y < img.height; y++) {
    textFont(font, fontSize);
    text(textOutput[y], 0, y * fontSize * 1.2); 
  }
  
}
  
