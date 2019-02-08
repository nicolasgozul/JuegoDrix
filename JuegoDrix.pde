float a;
float posX[];
float posY[];
int estado [];
float distancia=0;
int puntaje =0;
int time = 0;

float x = 50;
float y = 50;
float angle1 = 0.0;
float segLength = 50;

PImage fondo;
PImage drix;
//PImage disparo;
PImage Virus1;
PImage Virus2;
PImage Virus3;

int boton = 0;

void setup(){
  size (563, 449);
  fondo = loadImage ("fondoEstomago.png");
  //disparo = loadImage ("Disparo.png");
  drix = loadImage ("Drix.png");
  Virus1 = loadImage ("Virus1.png");
  Virus2 = loadImage ("Virus2.png");
  Virus3 = loadImage ("Virus3.png");
  
  posX = new float[100];
  posY = new float[100];
  
  estado = new int[100];
  
  for (int i=0;i<100;i++){
    posX[i] = random(563);
    posY[i] = random(100);
    
    estado[i]=1;
  }
}

void draw (){
  image(fondo,0,0);
  //image(disparo,0,0);
  
  for(int i=0;i<100;i++){
    posY[i] = posY[i] + random(1,3);
  }
  
  for(int i=0;i<100;i++){
    if(estado[i] == 1){
      image(Virus1,posX[i],posY[i],20,20);
    }
  }
  
  for(int i=0;i<100;i++){
    if(estado[i] == 1){
      image(Virus2,posX[i],posY[i],20,20);
    }
  }
  
  
  for(int i=0;i<100;i++){
    if(mousePressed){
      distancia = dist(mouseX,mouseY,posX[i],posY[i]);
      if(distancia<=30){
        estado[i]=0;
      }
    }
  }
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
  segment(x, y, angle1);
  
  fill(255);
 text("Score: " + puntaje,30,40);
 
 puntaje = 0;
 for(int i=0;i<100;i++){
   if(estado[i] ==0){
     puntaje = puntaje + 1;
   }
 }
 
 
  /*Tiempo*/
 time = millis()/1000; 
 text("Tiempo: "+time,300,30);


}//Cierre draw

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  image(  drix, -drix.width/2, -drix.height/2);
  //line(0, 0, segLength, 0);
  popMatrix();
}
