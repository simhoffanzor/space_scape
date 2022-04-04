class Nave{
  color relleno;
  color sombra;
  int x;
  int y;
  int sizeCentro;
  int sizeTurbinas;
  int velocidad;
  
  Nave (color tempRelleno, int tempX, int tempY){
    relleno = tempRelleno;
    sombra = color (0);
    x = tempX;
    y = tempY;
    sizeCentro = 30;
    sizeTurbinas = 10;
    velocidad = 10;
    }
    
  void mostrar(){
     noStroke();
     fill(sombra);
     rect(x-4, y+4, sizeCentro, sizeCentro);
     rect(x-10-4, y+10+4, sizeTurbinas, sizeCentro);
     rect(x+30-4, y+10+4, sizeTurbinas, sizeCentro);
     rect(x+10-4, y-10+4, sizeTurbinas, sizeTurbinas);
     fill(relleno);
     rect(x, y, sizeCentro, sizeCentro);
     rect(x-10, y+10, sizeTurbinas, sizeCentro);
     rect(x+30, y+10, sizeTurbinas, sizeCentro);
     rect(x+10, y-10, sizeTurbinas, sizeTurbinas);
     }
     
   void mover(){
     if (keyPressed == true){
       if (keyCode == LEFT){
         x = x - velocidad;
         }
       else if (keyCode == RIGHT){
         x = x + velocidad;
         }
       }
     }
     }
