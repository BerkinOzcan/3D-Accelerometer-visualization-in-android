import  ketai.sensors.*;
KetaiSensor  sensor;
float  accelerometerX,  accelerometerY,  accelerometerZ, kureX, kureY, kureZ;

void  setup()
{ 
size(displayWidth,displayHeight,P3D);
  sensor  =  new  KetaiSensor(this);
sensor.start();   
orientation(PORTRAIT);    
textAlign(CENTER,  CENTER);                                                       
textSize(72);                                                                                 
}
void  draw() 
{    
lights();

  background(78,  93,  75);   
fill(0,0,0,100);
text("Accelerometer:  \n"  +                                                      
"x:  "  +  nfp(accelerometerX,  2,  3)  +  "\n"  +    
"y:  "  +  nfp(accelerometerY,  2,  3)  +  "\n"  +     
"z:  "  +  nfp(accelerometerZ,  2,  3),  width/2,  height/2); 
pushMatrix();

kureX=map(accelerometerX,-20,20,width,0);
kureY=map(accelerometerY,-20,20,0,height);
kureZ=map(accelerometerZ,-20,20,-1000,1000);
translate(kureX, kureY, -kureZ);
fill(255,0,50);
strokeWeight(1);
sphere(displayHeight/15);
popMatrix();
strokeWeight(50);
line(width/2,height/2,0,kureX, kureY, -kureZ);
}
void  onAccelerometerEvent(float  x,  float  y,  float  z) 
{   
accelerometerX  =  x;    
accelerometerY  =  y;    
accelerometerZ  =  z; 

}
