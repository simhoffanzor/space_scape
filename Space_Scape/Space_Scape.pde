//VARIABLES

//BOTONES
BotonEmpezar bempezar;
boolean bnaveroja = false;
boolean bnaveazul = false;
boolean terminar = false;

//PERSONAJES
Nave nave1;
Nave nave2;
Nave naveroja;
Nave naveazul;
Combustible combustible;
ArrayList<Marciano> marciano;

//PANTALLA DE TITULO
PImage fondo;
color letras = color(177, 106, 255);
PFont ftitulo;
PFont fsubtitulo;
String titulo = "SPACE SCAPE";
String subtitulo = "Aprieta     el     botón     para     comenzar";

//PANTALLA DE SELECCION
PImage elegir;
PFont fseleccionar;
PFont finstrucciones;
String seleccionar = "Elige con qué nave jugarás";
String instrucciones = "Esquiva a los marcianos para no perder vidas";
String instrucciones2 = "y recarga combustible para ganar puntos";

//PANTALLA DE JUEGO
PImage fondo2;
PFont fpuntaje;
int xselec, yselec;
int vidas = 7;
int puntaje = 0;
Barreras barreras1;
Barreras barreras2;

//PANTALLA DE PERDER O GANAR
PFont fadorno;
PFont fyoulose;
String youlose = "You Lose";
int yly;
PFont fganaste;
String ganaste = "You Win!";
int ganastesize;
PFont fvolver;
String volver = "Para volver a jugar, aprieta la tecla V";
float volversize;

//PROGRAMA DE ARRANQUE
void setup() {
  size(900, 600);
  //FUENTES
  fondo = loadImage("Fondo.jpg");
  fondo2 = loadImage("Fondo2.jpeg");
  elegir = loadImage("Elegir.jpg");
  ftitulo = loadFont("SpaceAge-95.vlw");
  fsubtitulo = loadFont("SpaceAge-30.vlw");
  fseleccionar = loadFont("ChickenQuiche-70.vlw");
  finstrucciones = loadFont("PaperFlowers-40.vlw");
  fpuntaje = loadFont("ArialMT-15.vlw");
  fadorno = loadFont("Planets-100.vlw");
  fyoulose = loadFont("SPOOKYMONSTER-100.vlw");
  //BOTONES
  bempezar = new BotonEmpezar();
  nave1 = new Nave (color (255, 64, 99), 300, height/2);
  nave2 = new Nave (color (64, 104, 255), width-300, height/2);
  //ASPECTO
  barreras1 = new Barreras(color (255, 177, 233), color(255, 0, 0));
  barreras2 = new Barreras(color (198, 220, 255), color(0, 0, 255));
  textAlign(CENTER);
  xselec = -450;
  yselec = 200;
  yly = -200;
  ganastesize = 20;
  volversize = 2;
  //PERSONAJES
  naveroja = new Nave (color (255, 64, 99), width/2, height - 70);
  naveazul = new Nave (color (64, 104, 255), width/2, height - 70);
  combustible = new Combustible(int (random (200, width-200)), int (random(-2500, 1500)), 4);
  marciano = new ArrayList<Marciano>();
  for (int i=0; i < 3; i++) {  
    Marciano m = new Marciano(int (random(200, width-200)), int (random(-1500, 50)), 4);
    marciano.add(m);
  }
} //Cierra "SetUp"

void draw() {

  //PANTALLA INICIAL  
  if (bempezar.interruptor == false) {
    image(fondo, 0, 0);
    textFont(ftitulo);
    fill(0);
    text(titulo, width/2-4, height/2+4);
    fill(letras);
    text(titulo, width/2, height/2);
    textFont(fsubtitulo);
    fill(0);
    text(subtitulo, width/2-2, height/2+102);
    fill(letras);
    text(subtitulo, width/2, height/2 + 100);
    bempezar.display();
  }

  //SI HAGO CLICK EN EMPEZAR
  else if (bempezar.interruptor == true ) {
    image(elegir, 0, 0);
    textFont(fseleccionar);
    fill(0);
    text(seleccionar, xselec-3, yselec+3);
    fill(letras);
    text(seleccionar, xselec, yselec);
    if (xselec < width/2) xselec = xselec+4;
    textFont(finstrucciones);
    fill(0);
    text(instrucciones, width/2, height-150);
    text(instrucciones2, width/2, height-100);
    nave1.mostrar();
    nave2.mostrar();

    //SI HAGO CLICK EN LA NAVE ROJA
    if (bnaveroja == true) {
      if (vidas > 0 && terminar ==false) {
        image(fondo2, 0, 0); 
        naveroja.mostrar();
        naveroja.mover();
        combustible.display();
        combustible.move();
        combustible.toroide();

        for (int i = 0; i < marciano.size(); i++) {
          Marciano m = marciano.get(i);
          m.mostrar();
          m.mover();
          m.toroide();

          //Perder vidas
          float dEnemigos = dist(naveroja.x, naveroja.y, m.x, m.y);

          if (dEnemigos < 50 || (naveroja.x < 150) || (naveroja.x > width-200)) {
            background(255, 0, 0, 100);
            naveroja.x = width/2;
            naveroja.y = height-70;
            m.x = int (random(150, width-150));
            m.y = int (random(-1500, 50));
            vidas = vidas - 1;
          } //cierra el if
        } //cierra el for de movimiento de marcianos

        //FONDO      
        barreras1.display();         

        //INDICADOR DE VIDAS
        for (int v = 1; v <= vidas; v++) {
          stroke(0);
          fill(255, 0, 0);
          ellipse(v*15, 20, 10, 10);
        }   //cierra el for indicador de vidas

        //GANAR PUNTOS:
        float dCombustible = dist(naveroja.x, naveroja.y, combustible.x, combustible.y);

        if (dCombustible < 50) {
          puntaje = puntaje + 1;
          combustible.x = int (random (150, width-150));
          combustible.y = int (random(-1000, -50));
        }

        //INDICADOR DE PUNTAJES
        fill(0);
        textFont(fpuntaje);
        text("Puntaje actual:", width-80, 20);
        text(puntaje, width-20, 20);
      } //cierra el "vidas mayor a 0"

      if (puntaje == 10) {
        terminar = true;
        //background(0);
        image(fondo, 0, 0);
        fill(255, 50);
        textFont(fadorno);
        text("a b c d e f g h", width/2, 100);
        text(" q r s t u v w ", width/2, height/4+100);
        text("i j k l m n o p", width/2, height/2+100);
        text(" y z h g f b a ", width/2, height/2+height/4+100);
        textFont(ftitulo);
        textSize(ganastesize);
        if (ganastesize < 100) ganastesize = ganastesize + 1;
        fill(0);
        text(ganaste, width/2-5, height/2+5);
        fill(letras);
        text(ganaste, width/2, height/2);
        textSize(volversize);
        if (volversize < 30) volversize = volversize + 0.4;
        fill(0);
        text(volver, width/2-3, height/2 + 100+3);
        fill(letras);
        text(volver, width/2, height/2 + 100);
      }

      if (vidas == 0) {
        terminar = true;
        image(fondo2, 0, 0);
        fill(255, 50);
        textFont(fadorno);
        text("a b c d e f g h", width/2, 100);
        text(" q r s t u v w ", width/2, height/4+100);
        text("i j k l m n o p", width/2, height/2+100);
        text(" y z h g f b a ", width/2, height/2+height/4+100);
        textFont(fyoulose);
        fill(0);
        text(youlose, width/2-5, yly+5);
        fill(letras);
        text(youlose, width/2, yly);
        if (yly < height/2) yly = yly + 3;
        if (yly >= height/2) {
          textSize(30);
          fill(0);
          text(volver, width/2-5, height/2 + 100 + 5);
          fill(letras);
          text(volver, width/2, height/2 + 100);
        }
      }

      //VOLVER A JUGAR
      if (keyPressed==true && (key=='V' || key == 'v')) {
        puntaje=0;
        vidas=7;
        terminar = false;
        combustible.x = int (random(150, width-150));
        combustible.y = int (random(-1500, -50));
      }
    } //Cierra el "clic en la nave roja"


    //SI HAGO CLICK EN LA NAVE AZUL
    if (bnaveazul == true) {
      if (vidas > 0 && terminar ==false) {
        image(fondo2, 0, 0); 
        naveazul.mostrar();
        naveazul.mover();
        combustible.display();
        combustible.move();
        combustible.toroide();

        for (int i = 0; i < marciano.size(); i++) {
          Marciano m = marciano.get(i);
          m.mostrar();
          m.mover();
          m.toroide();

          //Perder vidas
          float dEnemigos = dist(naveazul.x, naveazul.y, m.x, m.y);

          if (dEnemigos < 50 || (naveazul.x < 150) || (naveazul.x > width-200)) {
            background(255, 0, 0, 100);
            naveazul.x = width/2;
            naveazul.y = height-70;
            m.x = int (random(150, width-150));
            m.y = int (random(-1500, 50));
            vidas = vidas - 1;
          } //cierra el if
        } //cierra el for de movimiento de marcianos

        //FONDO      
        barreras2.display();         

        //INDICADOR DE VIDAS
        for (int v = 1; v <= vidas; v++) {
          stroke(0);
          fill(255, 0, 0);
          ellipse(v*15, 20, 10, 10);
        }   //cierra el for indicador de vidas

        //GANAR PUNTOS:
        float dCombustible = dist(naveazul.x, naveazul.y, combustible.x, combustible.y);

        if (dCombustible < 50) {
          puntaje = puntaje + 1;
          combustible.x = int (random (150, width-150));
          combustible.y = int (random(-1000, -50));
        }

        //INDICADOR DE PUNTAJES
        fill(0);
        textFont(fpuntaje);
        text("Puntaje actual:", width-80, 20);
        text(puntaje, width-20, 20);
      } //cierra el "vidas mayor a 0"

      if (puntaje == 10) {
        terminar = true;
        //background(0);
        image(fondo, 0, 0);
        fill(255, 50);
        textFont(fadorno);
        text("a b c d e f g h", width/2, 100);
        text(" q r s t u v w ", width/2, height/4+100);
        text("i j k l m n o p", width/2, height/2+100);
        text(" y z h g f b a ", width/2, height/2+height/4+100);
        textFont(ftitulo);
        textSize(ganastesize);
        if (ganastesize < 100) ganastesize = ganastesize + 1;
        fill(0);
        text(ganaste, width/2-5, height/2+5);
        fill(letras);
        text(ganaste, width/2, height/2);
        textSize(volversize);
        if (volversize < 30) volversize = volversize + 0.4;
        fill(0);
        text(volver, width/2-3, height/2 + 100+3);
        fill(letras);
        text(volver, width/2, height/2 + 100);
      }

      if (vidas == 0) {
        terminar = true;
        image(fondo2, 0, 0);
        fill(255, 50);
        textFont(fadorno);
        text("a b c d e f g h", width/2, 100);
        text(" q r s t u v w ", width/2, height/4+100);
        text("i j k l m n o p", width/2, height/2+100);
        text(" y z h g f b a ", width/2, height/2+height/4+100);
        textFont(fyoulose);
        fill(0);
        text(youlose, width/2-5, yly+5);
        fill(letras);
        text(youlose, width/2, yly);
        if (yly < height/2) yly = yly + 3;
        if (yly >= height/2) {
          textSize(30);
          fill(0);
          text(volver, width/2-5, height/2 + 100 + 5);
          fill(letras);
          text(volver, width/2, height/2 + 100);
        }
      }

      //VOLVER A JUGAR
      if (keyPressed==true && (key=='V' || key == 'v')) {
        puntaje=0;
        vidas=7;
        terminar = false;
        combustible.x = int (random(150, width-150));
        combustible.y = int (random(-1500, -50));
      }
    } //Cierra el "clic en la nave azul"
  }//cierra el "clic en empezar"
} //Cierra el void draw
