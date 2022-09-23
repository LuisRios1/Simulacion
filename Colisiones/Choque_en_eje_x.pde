float x = 25, x2=300;
float y = 300, y2=300;
float velx= 4, velx2=-1;
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
  fill(255,0,0);
  ellipse(x2, y2, 25, 25);

//Movimiento
  x += velx;
  x2 += velx2;
  
//Colision
 if ((x >= x2-25 && x <= x2+25) && (y >= y2-25 && y <= y2+25)) {
    
    //Calculo choque frontal
      velx = ((m1-e*m2)*velx/(m1+m2))+(((1+e)*m2)*velx2/(m1+m2));
      velx2= (((1+e)*m1)*velx/(m1+m2))+((m2-e*m1)*velx2/(m1+m2));
  }
}
