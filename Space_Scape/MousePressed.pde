void mousePressed(){
  if ((mouseX > bempezar.x) && (mouseX < bempezar.x + bempezar.w) &&
      (mouseY > bempezar.y) && (mouseY < bempezar.y + bempezar.h)){
        if (bempezar.interruptor){
          bempezar.interruptor = false;
          }
        else {
          bempezar.interruptor = true;
          }
          }
          
  if ((mouseX > nave1.x) && (mouseX < nave1.x + nave1.sizeCentro) &&
      (mouseY > nave1.y) && (mouseY < nave1.y + nave1.sizeCentro)){
        if (bnaveroja){
          bnaveroja = false;
          }
        else {
          bnaveroja = true;
          }
          }
          
   if ((mouseX > nave2.x) && (mouseX < nave2.x + nave2.sizeCentro) &&
       (mouseY > nave2.y) && (mouseY < nave2.y + nave2.sizeCentro)){
        if (bnaveazul){
          bnaveazul = false;
          }
        else {
          bnaveazul = true;
          }
          }  
 
 }
 
