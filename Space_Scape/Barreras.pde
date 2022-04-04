class Barreras{
  int x1;
  int x2;
  int y;
  int w;
  int h;
  color relleno;
  color textura;
  int tx1;
  int tx2;
  int tx3;
  int tx4;
  int[] y1 = {50, 150, 250, 350, 450, 550};
  int[] y2 = {100, 200, 300, 400, 500};
  int tsize;
  
  Barreras(color tempRelleno, color tempTextura){
    x1 = 0;
    x2 = width-150;
    y = 0;
    w = 150;
    h = height;
    relleno = tempRelleno;
    textura = tempTextura;
    tx1 = 50;
    tx2 = 100;
    tx3 = width-50;
    tx4 = width-100;
    tsize = 10;
    }
    
  void display(){
    noStroke();
    fill(relleno);
    rect(x1, y, w, h);
    rect(x2, y, w, h);
    
    for (int i = 0; i < y1.length; i++){
      fill(textura);
      rect(tx1, y1[i], tsize, tsize);
      rect(tx3, y1[i], tsize, tsize);
      rect(x1+w, y, tsize, height);
      }
    for (int j = 0; j < y2.length; j++){
      fill(textura);
      rect(tx2, y2[j], tsize, tsize);
      rect(tx4, y2[j], tsize, tsize);
      rect(x2, y, tsize, height);
      }
    }
  }
