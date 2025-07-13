//Darkko Nair Jorajuria Etchevarne
// https://youtu.be/9SQaywjYpVs
// Hice por separado la grabación de la camara de la pantalla.

int cols = 8;
int rows = 8;
float espacio = 45;
float radio = 14;
boolean animar = false;
PImage img;

void setup() {
  size(800, 400);
  img = loadImage("F_7.jpeg");
  noStroke();
}

void draw() {
  background(0);
  image(img, 0, 0, 400, 400);
  
  pushMatrix();
  translate(420, 50);
  
  fill(120);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * espacio;
      float y = j * espacio;
      rect(x - 6, 0, 12, (rows - 1) * espacio);
      rect(0, y - 6, (cols - 1) * espacio, 12);
    }
  }

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * espacio;
      float y = j * espacio;
      
      if (animar) {
        float r = map(sin(frameCount * 0.05 + i + j), -1, 1, 100, 255);
        float g = map(cos(frameCount * 0.05 + j), -1, 1, 100, 255);
        float b = map(dist(mouseX - 420, mouseY - 50, x, y), 0, width/2, 255, 50);
        fill(r, g, b);
        float offsetX = map(sin(frameCount * 0.1 + i), -1, 1, -3, 3);
        float offsetY = map(cos(frameCount * 0.1 + j), -1, 1, -3, 3);
        float nuevoRadio = map(dist(mouseX - 420, mouseY - 50, x, y), 0, width/2, radio * 1.5, radio * 0.3);
        nuevoRadio = constrain(nuevoRadio, 2, 20);
        ellipse(x + offsetX, y + offsetY, nuevoRadio, nuevoRadio);
      } else {
        fill(255);
        ellipse(x, y, radio, radio);
      }
    }
  }
  
  popMatrix();
}

void mousePressed() {
  animar = !animar;
}

void keyPressed() {
  if (keyCode == UP) radio += 1;
  else if (keyCode == DOWN) radio -= 1;
  else if (key == 'r' || key == 'R') {
    radio = 14;
    animar = false;
  }
}
