void setup(){
  size(600,400);
}
float size1,size2;

void e1(){
  size1= (600-mouseX);
  fill(255,0,0);
  ellipse(200,200,size1,size1);
}
void e2(){
  size2= (mouseX);
  fill(0,0,255);
  ellipse(400,200,size2,size2);
}
void draw(){
  background(0);
   e1();
   e2();
}
