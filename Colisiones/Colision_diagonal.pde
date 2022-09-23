float x = 180, x2=455;
float y = 45, y2=455;
float velx= 2, velx2=-2;
float vely= 3, vely2=-3;
float vp1, vn1, vp2, vn2;
float m1=10, m2=2;
float e =0.1;
float a1=45, a2=45;

void setup() {
  size(480, 480);
}

void draw() {
  background(255);
  
//Esfera 1
  fill(0,0,0);
  ellipse(x, y, 25, 25);
  
//Esfera 2
  fill(0,0,255);
  ellipse(x2, y2, 25, 25);

//Movimiento
  x += velx;
  y += vely;

  x2 += velx2;
  y2 += vely2;


 
//Cambio de sentido impacto con otra bola
  //Colisiones en Elipse1
  if ((x >= x2-25 && x <= x2+25) && (y >= y2-25 && y <= y2+25)) {
    
    //Calculo inicial Vp - Vn
      vp1 = velx*cos(a1) + vely*sin(a1);
      vn1 = -velx*sin(a1) + vely*cos(a1);
      vp2 = velx2*cos(a2) + vely2*sin(a2);
      vn2 = -velx2*sin(a2) + vely2*cos(a2);
      
    //Calculo delta Vp - Vn
      vp1 = ((m1-e*m2)*vp1/(m1+m2))+(((1+e)*m2)*vp2/(m1+m2));
      vp2 = (((1+e)*m1)*vp1/(m1+m2))+((m2-e*m1)*vp2/(m1+m2));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx=vp1*cos(a1)-vn1*sin(a1); 
      vely=vp1*sin(a1)+vn1*cos(a1);
      velx2=vp2*cos(a2)-vn2*sin(a2);
      vely2=vp2*sin(a2)+vn2*cos(a2);
  }
}
