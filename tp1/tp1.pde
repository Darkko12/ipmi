PImage fondo;

void setup() {
  size(800, 400);
  fondo = loadImage("perros.png");
  noLoop();
}

void draw() {
  noStroke();
  fill(175, 112, 62);
  rect(0, 0, width, height / 2);
  fill(40, 20, 10);
  rect(0, height / 2, width, height / 2);
  stroke(90, 60, 30);
  strokeWeight(3);
  line(0, height / 2, width, height / 2);

  image(fondo, 0, 0, 400, 400);
  
  dibujarPerros(470, 130, true); //arriba izquierda
  dibujarSillas(530, 160, true); //silla arriba
  dibujarLuz();
  dibujarMesa();
  dibujarSillas();
  dibujarFichas();
  dibujarPerros();
  dibujarCartas();
  dibujarFichas();
  fill(255);
}

void dibujarLuz() {
  noStroke();
  fill(139, 95, 60, 100);
  ellipse(615, 10, 120, 90); 
}

void dibujarMesa() {
  fill(70, 40, 20);
  stroke(40, 20, 10);
  strokeWeight(4);
  ellipse(600, 240, 320, 110);
}

void dibujarCartas() {
  float x = 530;
  float y = 190;

  for (int i = 0; i < 5; i++) {
    dibujarCartas(x + i * 22, y);
  }
}
  void dibujarCartas(float x, float y) {
  fill(245);
  stroke(0);
  rect(x, y, 20, 30, 4);
  textSize(4);
  fill(0);
  

}
void dibujarFichas() {
  dibujarFichas(585, 246, color(32, 38, 160), 2);
  dibujarFichas(610, 222, color(199, 0, 57), 4);
  dibujarFichas(565, 232, color(59, 176, 59), 3);
  dibujarFichas(640, 260, color(32, 38, 160), 2);
  dibujarFichas(575, 263, color(199, 0, 57), 5);
  dibujarFichas(600, 251, color(59, 176, 59), 3);
  dibujarFichas(615, 237, color(199, 0, 57), 4);
  dibujarFichas(630, 245, color(32, 38, 160), 3);
  dibujarFichas(590, 227, color(59, 176, 59), 2);
  dibujarFichas(645, 234, color(199, 0, 57), 3);
  dibujarFichas(560, 240, color(32, 38, 160), 1);
  dibujarFichas(605, 248, color(59, 176, 59), 3);
  dibujarFichas(625, 255, color(199, 0, 57), 2);
  dibujarFichas(635, 241, color(32, 38, 160), 4);
  dibujarFichas(580, 239, color(59, 176, 59), 2);
  dibujarFichas(650, 258, color(199, 0, 57), 3);
  dibujarFichas(570, 250, color(0, 0, 255), 2);
  dibujarFichas(600, 222, color(199, 0, 57), 3);
  dibujarFichas(660, 231, color(59, 176, 59), 4);
  dibujarFichas(592, 261, color(199, 0, 57), 2);
  dibujarFichas(618, 230, color(32, 38, 160), 3);
  dibujarFichas(555, 243, color(59, 176, 59), 2);
  dibujarFichas(638, 252, color(199, 0, 57), 4);
  dibujarFichas(610, 265, color(32, 38, 160), 2);
  dibujarFichas(590, 242, color(59, 176, 59), 3);
  dibujarFichas(645, 226, color(199, 0, 57), 2);
  dibujarFichas(560, 227, color(32, 38, 160), 3);
  //use un randomizador para las coordenadas
}

void dibujarFichas(float x, float baseY, color c, int cantidad) {
  noStroke();
  for (int i = 0; i < cantidad; i++) {
    fill(c);
    ellipse(x, baseY - i * 3, 12, 4);
  }
}

void dibujarSillas() {
  dibujarSillas(730, 230, true); //silla derecha 1
  dibujarSillas(400, 220, true); //silla izquierda 1
  dibujarSillas(680, 240, false);//silla derecha 2
  dibujarSillas(480, 240, true);//silla izquierda 2
}

void dibujarSillas(float x, float y, boolean frontal) {
  color tela = color(130, 40, 40);
  color madera = color(90, 60, 30);

  pushStyle();
  stroke(madera);
  strokeWeight(3);
  fill(tela);

  if (frontal) {
    beginShape();
    vertex(x, y);
    bezierVertex(x, y - 30, x + 60, y - 30, x + 60, y);
    vertex(x + 60, y + 70);
    vertex(x, y + 70);
    endShape(CLOSE);
    rect(x + 8, y + 70, 44, 16, 4);
    strokeWeight(5);
    line(x + 5, y + 70, x + 5, y + 110);
    line(x + 55, y + 70, x + 55, y + 110);
  } else {
    beginShape();
    vertex(x, y);
    bezierVertex(x, y - 25, x + 30, y - 25, x + 30, y);
    vertex(x + 30, y + 70);
    vertex(x, y + 70);
    endShape(CLOSE);
    rect(x + 4, y + 70, 22, 16, 4);
    strokeWeight(5);
    line(x + 2, y + 70, x + 2, y + 105);
    line(x + 28, y + 70, x + 28, y + 105);
  }

  popStyle();
}

void dibujarPerros() {
  dibujarPerros(730, 230, true); //derecha 1
  dibujarPerros(400, 220, true); //izquierda 1
  dibujarPerros(680, 240, false); //derecha 2
  dibujarPerros(480, 240, true); // izquierda 2
  dibujarPerros(530, 140, true); //bajo mesa
}

void dibujarPerros(float x, float y, boolean frontal) {
  pushStyle();
  noStroke();
  fill(120, 80, 50);

  if (frontal) {
    ellipse(x + 30, y + 50, 30, 50); 
    ellipse(x + 30, y + 20, 30, 30);  
    ellipse(x + 18, y + 15, 8, 15);  
    ellipse(x + 42, y + 15, 8, 15);  
    fill(0);
    ellipse(x + 24, y + 20, 4, 4);   
    ellipse(x + 36, y + 20, 4, 4); 
    fill(80, 50, 30);
    ellipse(x + 30, y + 28, 12, 8);
    fill(120, 80, 50);
    ellipse(x + 22, y + 70, 8, 12); 
    ellipse(x + 38, y + 70, 8, 12);
  } else {
    ellipse(x + 15, y + 50, 25, 50); 
    ellipse(x + 25, y + 20, 25, 25); 
    ellipse(x + 30, y + 15, 6, 12); 
    fill(0);
    ellipse(x + 28, y + 20, 3, 3);  
    fill(80, 50, 30);
    ellipse(x + 35, y + 25, 8, 6);    
    fill(120, 80, 50);
    ellipse(x + 10, y + 70, 6, 12);   
    ellipse(x + 20, y + 70, 6, 12);   
  
}
  popStyle();
}
