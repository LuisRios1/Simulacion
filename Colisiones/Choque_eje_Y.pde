float x = 300, x2=300;
float y = 455, y2=25;
float vely= -10, vely2=5;
float m1=3, m2=2;
float e =0.7;

void setup() {
  size(480, 480);
}

void draw() {
  background(255);
  
//Esfera 1
  fill(0,0,0);
  ellipse(x, y, 25, 25);
  
//Esfera 2
  fill(0,255,0);
  ellipse(x2, y2, 25, 25);

//Movimiento
  y += vely;
  y2 += vely2;
  
//Colision
 if ((x >= x2-25 && x <= x2+25) && (y >= y2-25 && y <= y2+25)) {
    
    //Calculo choque frontal
      vely = ((m1-e*m2)*vely/(m1+m2))+(((1+e)*m2)*vely2/(m1+m2));
      vely2= (((1+e)*m1)*vely/(m1+m2))+((m2-e*m1)*vely2/(m1+m2));
  }
}
