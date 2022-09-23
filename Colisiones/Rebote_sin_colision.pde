float x = 25, x2=100, x3=182, x4=25;
float y = 25, y2=450, y3=352, y4=247;
float velx= 2, velx2=1, velx3=5, velx4=2;
float vely= 3, vely2=4, vely3=5, vely4=2;

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
  
//Esfera 3
  fill(0,255,0);
  ellipse(x3, y3, 25, 25);
  
//Esfera 4
  fill(0,0,255);
  ellipse(x4, y4, 25, 25);
  

//Movimiento
  x += velx;
  y += vely;

  x2 += velx2;
  y2 += vely2;

  x3 += velx3;
  y3 += vely3;
 
  x4 += velx4;
  y4 += vely4;
  
  
 //Cambio de sentido al impacto contra el muro
  if (x <= 25 || x >= width-25 ) {
    velx *= -1;
  }

  if (y <=25  || y >= height-25) {
    vely *= -1;
  }
  
  if (x2 <= 25 || x2 >= width-25) {
    velx2 *= -1;
  }

  if (y2 <= 25  || y2 >= height-25) {
    vely2 *= -1;
  }
  
  if (x3 <= 25 || x3 >= width-25) {
    velx3 *= -1;
  }

  if (y3 <= 25  || y3 >= height-25) {
    vely3 *= -1;
  }
  
  if (x4 <= 25 || x4 >= width-25) {
    velx4 *= -1;
  }

  if (y4 <= 25  || y4 >= height-25) {
    vely4 *= -1;
  }

}
