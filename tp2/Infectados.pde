PImage[] imagenes = new PImage[3];
String[] textos = {
  "“Infectos” de Leo Nuñez es un ecosistema de robots autómatas infectados por tres virus que luchan por controlarlos.",
  "La interacción entre robots genera contagios, modificando su estado interno y color.",
  "La obra evoluciona constantemente según los contagios y la dinámica de los virus dentro de cada robot."
};

PFont fuente;
int pantalla = -1;
int tiempoPantalla = 5000;
int tiempoInicio;

float textoAlpha = 0;
float escalaTexto = 0.5;
float textoX = -300;

void setup() {
  size(640, 480);

  imagenes[0] = loadImage("infectos1.jpg");
  imagenes[1] = loadImage("infectos11.jpg");
  imagenes[2] = loadImage("infectos2.jpg");

  fuente = createFont("Arial", 20);
  textFont(fuente);
  textAlign(CENTER, TOP);
  rectMode(CENTER);
}

void draw() {
  background(0);

  if (pantalla == -1) {
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Hacer clic para iniciar", width / 2, height / 2);
    drawBoton("Iniciar", width / 2 - 50, height / 2 + 40, 100, 30);
  } else if (pantalla >= 0 && pantalla < 3) {
    image(imagenes[pantalla], 0, 0, width, height);

    fill(255);
    textSize(20);
    float yTexto = height * 0.7;
    float cajaW = width * 0.85;
    float cajaH = 110;

    if (pantalla == 0) {
      textoAlpha = min(255, textoAlpha + 5);
      // Sombra
      fill(0, textoAlpha);
      text(textos[0], width / 2 + 2, yTexto + 2, cajaW * 0.9, cajaH);
      // Texto blanco
      fill(255, textoAlpha);
      text(textos[0], width / 2, yTexto, cajaW * 0.9, cajaH);
    } else if (pantalla == 1) {
      escalaTexto = min(1.0, escalaTexto + 0.02);
      pushMatrix();
      translate(width / 2, yTexto);
      scale(escalaTexto);
      // Sombra
      fill(0);
      textAlign(CENTER, TOP);
      text(textos[1], 2, 2, cajaW * 0.9, cajaH);
      // Texto blanco
      fill(255);
      text(textos[1], 0, 0, cajaW * 0.9, cajaH);
      popMatrix();
    } else if (pantalla == 2) {
      textoX = min(width / 2, textoX + 8);
      // Sombra
      fill(0);
      textAlign(LEFT, TOP);
      text(textos[2], textoX + 2, yTexto + 2, cajaW * 0.9, cajaH);
      // Texto blanco
      fill(255);
      text(textos[2], textoX, yTexto, cajaW * 0.9, cajaH);
      textAlign(CENTER, TOP);
    }

    if (millis() - tiempoInicio > tiempoPantalla) {
      pantalla++;
      textoAlpha = 0;
      escalaTexto = 0.5;
      textoX = -300;
      tiempoInicio = millis();
    }
  } else if (pantalla == 3) {
    background(50, 80, 120);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Fin de la presentación", width / 2, height / 2 - 30);
    drawBoton("Reiniciar", width / 2 - 50, height / 2 + 20, 100, 30);
  }
}

void mousePressed() {
  if (pantalla == -1 && mouseSobreBoton(width / 2 - 50, height / 2 + 40, 100, 30)) {
    pantalla = 0;
    textoAlpha = 0;
    escalaTexto = 0.5;
    textoX = -300;
    tiempoInicio = millis();
  } else if (pantalla == 3 && mouseSobreBoton(width / 2 - 50, height / 2 + 20, 100, 30)) {
    pantalla = -1;
  }
}

boolean mouseSobreBoton(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void drawBoton(String texto, int x, int y, int w, int h) {
  fill(200);
  rect(x + w / 2, y + h / 2, w, h, 7);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text(texto, x + w / 2, y + h / 2);
}
