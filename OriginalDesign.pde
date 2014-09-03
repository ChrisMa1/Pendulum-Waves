void setup(){
  size(800,800);
  strokeWeight(5);
}
float size=30;
double theta=0;
class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  int R;
  int G;
  int B;
  int O;
  Ball(int x, int y){
     this.x= x; 
     this.y= y;
     //this.xSpeed=(int)(Math.random()*10-5);
     //this.ySpeed=(int)(Math.random()*10-5);
     this.R=(int)(Math.random()*200+55);
     this.G=(int)(Math.random()*200+55);
     this.B=(int)(Math.random()*200+55);
  }
}
Ball ballPos[]=new Ball[200];
int repcount=0;
int pointerX;
int pointerY;

void drawBall(){
  if(ballPos[0]!= null){
    for(int i=0; i<ballPos.length; i++){
      if(ballPos[i]!= null){
        ballPos[i].xSpeed=(ballPos[i].x - height*0.5)/-20.0;
        ballPos[i].ySpeed=(ballPos[i].y - width *0.5)/-20.0;
        
        ballPos[i].x+=ballPos[i].xSpeed;
        ballPos[i].y+=ballPos[i].ySpeed;
        
        size= (float)(20+dist(0.5*height,0.5*width, ballPos[i].x, ballPos[i].y)/8);
        noStroke();
        fill(ballPos[i].R, ballPos[i].G,ballPos[i].B,20+dist(0.5*height,0.5*width, ballPos[i].x, ballPos[i].y));
        ellipse(ballPos[i].x,ballPos[i].y, size,size);
      }
    }
  }
}
void drawLine(){  
  for(int i=1; i<ballPos.length-1; i++){
    if(ballPos[i]!= null){
      stroke(100,255,20,dist(0.5*height,0.5*width, ballPos[i].x, ballPos[i].y) );
      line(ballPos[i].x, ballPos[i].y, ballPos[i-1].x, ballPos[i-1].y);
    }  
  }  
  for(int i=10; i<ballPos.length-1; i++){
    if(ballPos[i]!= null){
      stroke(100,255,20,dist(0.5*height,0.5*width, ballPos[i].x, ballPos[i].y) );
      line(ballPos[i].x, ballPos[i].y, ballPos[i-10].x, ballPos[i-10].y);
    }  
  }  
}  
void spl(){
  for(int i=0; i<ballPos.length-1; i++){
    if(i==ballPos.length-1){
      ballPos[i]=null;
    }else{
      ballPos[i]=ballPos[i+1];
    }
  }    
}

void draw(){
  background(0);
  /*pointerX=(int)(Math.sin(theta)*height+height*0.5);
  pointerY=(int)(Math.cos(theta)*width+width*0.5);
  //ellipse(pointerX, pointerY,20,20);
  if(repcount>ballPos.length-1){repcount=ballPos.length-1; spl();}  
  ballPos[repcount]=new Ball(pointerX, pointerY); 
  repcount++;  
  //drawLine();
  drawBall();
  drawLine();
  theta+=0.5;
  //System.out.println(height*0.5 +", " +800*0.5 );
  */
}
