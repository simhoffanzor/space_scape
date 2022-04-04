class BotonEmpezar {

  int x;
  int y;
  int w;
  int h;
  boolean interruptor;
  color relleno;
  String empezar;
  color cfont; 
  int xs;
  PFont fboton;
  
BotonEmpezar(){
  x = width/2-85;
  y = height-100;
  w = 170;
  h = 50;
  interruptor = false;
  empezar = "Empezar";
  cfont = color (0);
  xs = width/2;
  fboton = loadFont("ChickenQuiche-30.vlw");
  }
  
  void display(){
             
         if ((mouseX > x) && (mouseX < x + w) &&
            (mouseY > y) && (mouseY < y + h)){
               relleno = color (175);
               cfont = color (255);
               }
         else {
               relleno = color (255,204,15);
               cfont = color (0);
               }
               
               fill(relleno);
               rect(x, y, w, h);
               fill(cfont);
               textAlign(CENTER);
               textFont(fboton);
               text(empezar, xs, y+35);
         }
  }    
