void setup(){
  size(400,400);
}
int size=15;
public class Ball{
  int x;
  int y;
  float xSpeed;
  float ySpeed;
  int R;
  int G;
  int B;
  int O;
  Ball(int x, int y){
     this.x= x; 
     this.y= y;
     this.xSpeed=(int)(Math.random()*10-5);
     this.ySpeed=(int)(Math.random()*10-5);
     this.R=(int)(Math.random()*255);
     this.G=(int)(Math.random()*255);
     this.B=(int)(Math.random()*255);
     this.O=(int)(Math.random()*200+55);
  }
}
Ball ballPos[]=new Ball[10000];
int count=0;

void drawBall(){
  if(ballPos[0]!= null){
    for(int i=0; i<ballPos.length; i++){
      if(ballPos[i]!= null){
        //ballPos[i].xSpeed=5/(1);
        //ballPos[i].ySpeed=5/(1);
        ballPos[i].x+=ballPos[i].xSpeed;
        ballPos[i].y+=ballPos[i].ySpeed;
        if(ballPos[i].x>=width-size*0.5 || ballPos[i].x<=size*0.5){
          ballPos[i].xSpeed*= -1;
        }
        if(ballPos[i].y>=width-size*0.5 || ballPos[i].y<=size*0.5){
          ballPos[i].ySpeed*= -1;
        }
        fill(ballPos[i].R, ballPos[i].G,ballPos[i].B,ballPos[i].O);
        ellipse(ballPos[i].x,ballPos[i].y, size,size);
      }
    }
  }
}


void draw(){
  background(0,0,0);
  if(count>ballPos.length-1){
    count=0;
  }
  ballPos[count]=new Ball(mouseX, mouseY);   
  count++;
  System.out.println(count);
  drawBall();
}
