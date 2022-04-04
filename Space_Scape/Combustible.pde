class Combustible {
  int x;
  int y;
  int velocidad;
  PImage combimage;
  
  Combustible(int tempX, int tempY, int tempV){
    x = tempX;
    y = tempY;
    velocidad = tempV;
    combimage = loadImage("Combustible.png");
    }
    
    void display(){
      image(combimage, x, y);
      }
      
    void move(){
      y = y + velocidad;
      }
  
    void toroide(){
      if (y > height) { 
      x = int (random(200, width-200));
      y = int(random(-500,50)); }
      }  
  }
