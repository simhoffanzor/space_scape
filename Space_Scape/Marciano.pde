class Marciano{
  int x;
  int y;
  color cuerpo;
  color ojos;
  color pupilas;
  int size;
  int sizePatas;
  int sizeOjos;
  int sizePupilas;
  int velocidad;
  
  Marciano(int tempX, int tempY, int tempV){
    x = tempX;
    y = tempY;
    cuerpo = color (127, 237, 81);
    ojos = color (255);
    pupilas = color(0);
    size = 40;
    sizePatas = 25;
    sizeOjos = 10;
    sizePupilas = 5;
    velocidad = tempV;
    }
    
  void mostrar(){
    noStroke();
    fill(cuerpo);
    ellipse(x, y, size, size);
    rect(x - 2, y+10, 5, sizePatas);
    rect(x - 14, y+ 10, 5, sizePatas);
    rect(x + 10, y+10, 5, sizePatas);
    rect(x - 17, y + 33, 8, 3);
    rect(x + 10, y + 33, 8, 3);
    fill(ojos);
    ellipse(x-10, y, sizeOjos, sizeOjos);
    ellipse(x+10, y, sizeOjos, sizeOjos);
    fill(pupilas);
    ellipse(x-8, y, sizePupilas, sizePupilas);
    ellipse(x+8, y, sizePupilas, sizePupilas);
    ellipse(x, y + 10, sizeOjos, sizeOjos);
    }
    
  void mover(){
    y = y + velocidad;
    }
  
  void toroide(){
    if (y > height) { 
    x = int (random(200, width-200));
    y = int(random(-500,50)); }
    }
    
}
