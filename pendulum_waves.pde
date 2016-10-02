void setup(){
  size(800,800);
  for(int i=0; i<bpm.length;i++){
    lengths[i]=500/(sq(bpm[i]/60))-200;
  }
  for(int i=0;i<bpm.length;i++){
    array[i]=new Pendulum(400,0,lengths[i],bpm[i]);  
  }
}
int startAngle=30;
float g=9.8;
float[] bpm={51,52,53,54,55,56,57,58,59,60,61,62,63,64,65};
float[] lengths=new float[bpm.length];
Pendulum[] array=new Pendulum[bpm.length];
class Pendulum{
  int x,y;
  float leng, ballX, ballY, freq, count;
  Pendulum(int xpos, int ypos, float l, float bpm){
    x=xpos;
    y=ypos;
    leng=l;
    freq=bpm/60;
    ballX=x+leng*sin(degrees(startAngle));
    ballY=y+leng*cos(degrees(startAngle));
    count=0;
  }
  void run(){
    strokeWeight(3);
    stroke(120);
    line(x,y,ballX,ballY);
    stroke(1);
    ellipse(ballX,ballY,40,40);
    float constant= 1000.000/(360.000*freq);
    count=millis()/constant;
    float angle=startAngle*cos(radians(count));
    ballX=x+leng*sin(radians(angle));
    ballY=y+leng*cos(radians(angle));
  }
}

void draw(){
  background(0);
  for(int i=0;i<array.length;i++){
    array[i].run();
  }
}
