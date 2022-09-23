float x = 25, x2=100, x3=182, x4=25;
float y = 25, y2=450, y3=352, y4=247;
float velx= 2, velx2=1, velx3=5, velx4=2;
float vely= 3, vely2=4, vely3=5, vely4=2;
float vp1, vn1, vp2, vn2, vp3, vn3, vp4, vn4;
float m1=10, m2=2, m3=5, m4=2;
float e =0.1;
float ca1, ca2, ca3, ca4;
float h1, h2, h3, h4;
float co1, co2, co3, co4;
float a1, a2, a3, a4;

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
  
//Angulo de direccion
  //Bola 1
      ca1 = width - x;
      co1 = height - y;
      h1 = sqrt(pow(ca1,2)+pow(co1,2));
      a1= acos (ca1/h1);
      
  //Bola 2
      ca2 = width - x2;
      co2 = height - y2;
      h2 = sqrt(pow(ca2,2)+pow(co2,2));
      a2= acos (ca2/h2);
  
  //Bola 3
      ca3 = width - x3;
      co3 = height - y3;
      h3 = sqrt(pow(ca3,2)+pow(co3,2));
      a3= acos (ca3/h3);
      
  //Bola 4
      ca4 = width - x4;
      co4 = height - y4;
      h4 = sqrt(pow(ca4,2)+pow(co4,2));
      a4= acos (co4/h4);

 
//Cambio de sentido impacto con otra bola
  //Colisiones en Elipse1
  if ((x >= x3-25 && x <= x3+25) && (y >= y3-25 && y <= y3+25)) {
    
    //Calculo inicial Vp - Vn
      vp1 = velx*cos(a1) + vely*sin(a1);
      vn1 = -velx*sin(a1) + vely*cos(a1);
      vp3 = velx3*cos(a3) + vely3*sin(a3);
      vn3 = -velx3*sin(a3) + vely3*cos(a3);
      
    //Calculo delta Vp - Vn
      vp1 = ((m1-e*m3)*vp1/(m1+m3))+(((1+e)*m3)*vp3/(m1+m3));
      vp3 = (((1+e)*m1)*vp1/(m1+m3))+((m3-e*m1)*vp3/(m1+m3));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx=vp1*cos(a1)-vn1*sin(a1); 
      vely=vp1*sin(a1)+vn1*cos(a1);
      velx3=vp3*cos(a3)-vn3*sin(a3);
      vely3=vp3*sin(a3)+vn3*cos(a3);
  }
  
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
  
  if ((x >= x4-25 && x <= x4+25) && (y >= y4-25 && y <= y4+25)) {
      
    //Calculo inicial Vp - Vn
      vp1 = velx*cos(a1) + vely*sin(a1);
      vn1 = -velx*sin(a1) + vely*cos(a1);
      vp4 = velx4*cos(a4) + vely4*sin(a4);
      vn4 = -velx4*sin(a4) + vely4*cos(a4);
    
    //Calculo delta Vp - Vn
      vp1 = ((m1-e*m4)*vp1/(m1+m4))+(((1+e)*m4)*vp4/(m1+m4));
      vp4 = (((1+e)*m1)*vp1/(m1+m4))+((m4-e*m1)*vp4/(m1+m4));
    
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx=vp1*cos(a1)-vn1*sin(a1); 
      vely=vp1*sin(a1)+vn1*cos(a1);
      velx4=vp4*cos(a4)-vn4*sin(a4);
      vely4=vp4*sin(a4)+vn4*cos(a4);
  }
  
//Colisiones en Elipse2

  if ((x2 >= x3-25 && x2 <= x3+25) && (y2 >= y3-25 && y2 <= y3+25)) {
    
    //Calculo inicial Vp - Vn
      vp2 = velx*cos(a1) + vely*sin(a1);
      vn2 = -velx*sin(a1) + vely*cos(a1);
      vp3 = velx2*cos(a2) + vely2*sin(a2);
      vn3 = -velx*sin(a2) + vely2*cos(a2);
     
    //Calculo delta Vp - Vn
      vp2 = ((m2-e*m3)*vp2/(m2+m3))+(((1+e)*m3)*vp3/(m2+m3));
      vp3 = (((1+e)*m2)*vp2/(m2+m3))+((m3-e*m2)*vp3/(m2+m3));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx2=vp2*cos(a2)-vn2*sin(a2); 
      vely2=vp2*sin(a2)+vn2*cos(a2);
      velx3=vp3*cos(a3)-vn3*sin(a3);
      vely3=vp3*sin(a3)+vn3*cos(a3);
  }
  
  if ((x2 >= x4-25 && x2 <= x4+25) && (y2 >= y4-25 && y2 <= y4+25)) {
      
    //Calculo inicial Vp - Vn
      vp2 = velx2*cos(a2) + vely2*sin(a2);
      vn2 = -velx2*sin(a2) + vely2*cos(a2);
      vp4 = velx4*cos(a4) + vely4*sin(a4);
      vn4 = -velx4*sin(a4) + vely4*cos(a4);
      
    //Calculo delta Vp - Vn
      vp2 = ((m2-e*m4)*vp2/(m2+m4))+(((1+e)*m4)*vp4/(m2+m4));
      vp4 = (((1+e)*m2)*vp2/(m2+m4))+((m4-e*m2)*vp4/(m2+m4));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx2=vp2*cos(a2)-vn2*sin(a2); 
      vely2=vp2*sin(a2)+vn2*cos(a2);
      velx4=vp4*cos(a4)-vn4*sin(a4);
      vely4=vp4*sin(a4)+vn4*cos(a4);
  }
  
 /* if ((x2 >= x-25 && x2 <= x+25) && (y2 >= y-25 && y2 <= y+25)){
    
    //Calculo inicial Vp - Vn
      vp1 = velx*cos(a1) + vely*sin(a1);
      vn1 = -velx*sin(a1) + vely*cos(a1);
      vp2 = velx2*cos(a2) + vely2*sin(a2);
      vn2 = -velx2*sin(a2) + vely2*cos(a2);
      
    //Calculo delta Vp - Vn
      vp2 = ((m2-e*m1)*vp2/(m2+m1))+(((1+e)*m1)*vp1/(m2+m1));
      vp1 = (((1+e)*m2)*vp2/(m2+m1))+((m1-e*m2)*vp1/(m2+m1));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx=vp1*cos(a1)-vn1*sin(a1); 
      vely=vp1*sin(a1)+vn1*cos(a1);
      velx2=vp2*cos(a2)-vn2*sin(a2);
      vely2=vp2*sin(a2)+vn2*cos(a2);
  } */
  
//Colisiones en Elipse3

  if ((x3 >= x4-25 && x3 <= x4+25) && (y3 >= y4-25 && y3 <= y4+25)) {
      
    //Calculo inicial Vp - Vn
      vp3 = velx3*cos(a3) + vely3*sin(a3);
      vn3 = -velx3*sin(a3) + vely3*cos(a3);
      vp4 = velx4*cos(a4) + vely4*sin(a4);
      vn4 = -velx4*sin(a4) + vely4*cos(a4);
      
    //Calculo delta Vp - Vn
      vp3 = ((m3-e*m4)*vp3/(m3+m4))+(((1+e)*m4)*vp4/(m3+m4));
      vp4 = (((1+e)*m3)*vp3/(m3+m4))+((m4-e*m3)*vp4/(m3+m4));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx3=vp3*cos(a3)-vn3*sin(a3); 
      vely3=vp3*sin(a3)+vn3*cos(a3);
      velx4=vp4*cos(a4)-vn4*sin(a4);
      vely4=vp4*sin(a4)+vn4*cos(a4);
  }

/*  if ((x3 >= x-25 && x3 <= x+25) && (y3 >= y-25 && y3 <= y+25)) {
    
    //Calculo inicial Vp - Vn
      vp1 = velx*cos(a1) + vely*sin(a1);
      vn1 = -velx*sin(a1) + vely*cos(a1);
      vp3 = velx3*cos(a3) + vely3*sin(a3);
      vn3 = -velx3*sin(a3) + vely3*cos(a3);
      
    //Calculo delta Vp - Vn
      vp3 = ((m3-e*m1)*vp3/(m3+m1))+(((1+e)*m1)*vp1/(m3+m1));
      vp1 = (((1+e)*m3)*vp3/(m3+m1))+((m1-e*m3)*vp1/(m3+m1));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx=vp1*cos(a1)-vn1*sin(a1); 
      vely=vp1*sin(a1)+vn1*cos(a1);
      velx3=vp3*cos(a3)-vn3*sin(a3);
      vely3=vp3*sin(a3)+vn3*cos(a3);
  }
  
  if ((x3 >= x2-25 && x3 <= x2+25) && (y3 >= y2-25 && y3 <= y2+25)) {
    
    //Calculo inicial Vp - Vn
      vp2 = velx*cos(a1) + vely*sin(a1);
      vn2 = -velx*sin(a1) + vely*cos(a1);
      vp3 = velx2*cos(a2) + vely2*sin(a2);
      vn3 = -velx*sin(a2) + vely2*cos(a2);
     
    //Calculo delta Vp - Vn
      vp3 = ((m3-e*m2)*vp3/(m3+m2))+(((1+e)*m2)*vp2/(m3+m2));
      vp2 = (((1+e)*m3)*vp3/(m3+m2))+((m2-e*m3)*vp2/(m3+m2));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx2=vp2*cos(a2)-vn2*sin(a2); 
      vely2=vp2*sin(a2)+vn2*cos(a2);
      velx3=vp3*cos(a3)-vn3*sin(a3);
      vely3=vp3*sin(a3)+vn3*cos(a3);
  } */
  
//Colisiones en Elipse 4
    //Realizadas en las anteriores colisiones
 
/*  if ((x4 >= x3-25 && x4 <= x3+25) && (y4 >= y3-25 && y4 <= y3+25)) {
      
    //Calculo inicial Vp - Vn
      vp4 = velx4*cos(a4) + vely4*sin(a4);
      vn4 = -velx4*sin(a4) + vely4*cos(a4);
      vp3 = velx3*cos(a3) + vely3*sin(a3);
      vn3 = -velx3*sin(a3) + vely3*cos(a3);
      
    //Calculo delta Vp - Vn
      vp4 = ((m4-e*m3)*vp4/(m4+m3))+(((1+e)*m3)*vp3/(m4+m3));
      vp3 = (((1+e)*m4)*vp4/(m4+m3))+((m3-e*m4)*vp3/(m4+m3));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx4=vp4*cos(a4)-vn4*sin(a4);
      vely4=vp4*sin(a4)+vn4*cos(a4);
      velx3=vp3*cos(a3)-vn3*sin(a3); 
      vely3=vp3*sin(a3)+vn3*cos(a3);

  }
  
  if ((x4 >= x2-25 && x4 <= x2+25) && (y4 >= y2-25 && y4 <= y2+25)) {
      
    //Calculo inicial Vp - Vn
      vp2 = velx2*cos(a2) + vely2*sin(a2);
      vn2 = -velx2*sin(a2) + vely2*cos(a2);
      vp4 = velx4*cos(a4) + vely4*sin(a4);
      vn4 = -velx4*sin(a4) + vely4*cos(a4);
      
    //Calculo delta Vp - Vn
      vp4 = ((m4-e*m2)*vp4/(m4+m2))+(((1+e)*m2)*vp2/(m4+m2));
      vp2 = (((1+e)*m4)*vp4/(m4+m2))+((m2-e*m4)*vp2/(m4+m2));
      
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx4=vp4*cos(a4)-vn4*sin(a4);
      vely4=vp4*sin(a4)+vn4*cos(a4);
      velx2=vp2*cos(a2)-vn2*sin(a2); 
      vely2=vp2*sin(a2)+vn2*cos(a2);
      
  } 
  
  if ((x4 >= x-25 && x4 <= x+25) && (y4 >= y-25 && y4 <= y+25)) {
      
    //Calculo inicial Vp - Vn
      vp1 = velx*cos(a1) + vely*sin(a1);
      vn1 = -velx*sin(a1) + vely*cos(a1);
      vp4 = velx4*cos(a4) + vely4*sin(a4);
      vn4 = -velx4*sin(a4) + vely4*cos(a4);
    
    //Calculo delta Vp - Vn
      vp4 = ((m4-e*m1)*vp4/(m4+m1))+(((1+e)*m1)*vp1/(m4+m1));
      vp1 = (((1+e)*m4)*vp4/(m4+m1))+((m1-e*m4)*vp1/(m4+m1));
    
    //Calculo Delta Vx - Vy (Direccion post colicion)
      velx4=vp4*cos(a4)-vn4*sin(a4);
      vely4=vp4*sin(a4)+vn4*cos(a4);
      velx=vp1*cos(a1)-vn1*sin(a1); 
      vely=vp1*sin(a1)+vn1*cos(a1);

  } */
}
