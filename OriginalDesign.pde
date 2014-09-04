void setup(){
  size(400,600);
}
double size1,size2;

void e1(){
  size1= (600-mouseX);
  fill rgb(255,0,0);
  ellipse(200,200,size1);
}
void e2(){
  size2= (mouseX);
  fill rgb(0,0,255);
  ellipse(200,200,size1);
}
void draw(){
  e1();
  e2();
}
