boolean mouseInLeftC(float x, float y, float dx, float dy) {
  if (mouseX>x && mouseX<dx && mouseY>y && mouseY<dy && mousePressed && mouseButton == LEFT) {
    return true;
  } else {
    return false;
  }
}
void mousePressed() {
}
void mouseReleased() {
}
void presume() {
  if (canpresume && window == 4) {
    window = 1;
  } else if (canpresume && window ==1) {
    window = 4;
  }
}
class spriteAnim {
  PImage[] images;
  int cantidad;
  int frame;
  spriteAnim(String imagePrefix, int count) {
    cantidad = count;
    images = new PImage[cantidad];

    for (int i = 0; i < cantidad; i++) {
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % cantidad;
    image(images[frame], xpos, ypos, 50, 50);
  }

  int imgsize() {
    return images[0].width;
  }
}
