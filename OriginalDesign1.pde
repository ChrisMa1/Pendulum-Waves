boolean focused= true;
boolean show=false;

void setup() {
  size(1500,800);
   
  textAlign(CENTER, CENTER);
}

void draw(){
 String time="AM";
 int hr=hour();
 String s=str(second());
 if(focused){
   textSize(70); 
   fill(0,0,0,20);
   rect(0,0,width, height);
   fill(255,0,0);
   text("FOCUSED", width/2, height/2);
   textSize(30);
   if(hr>12){hr-=12;time="PM";}else{time="AM";};
   if(second()<10){s="0"+s;};
   text(hr+":"+ minute()+":"+s+time, width/2, height/2 +50);
 }else{
   textSize(70); 
   fill(255,0,0,20);
   rect(0,0,width, height);
   fill(0,0,0);
   text("BREAK", width/2, height/2);
 }
 if(show){cross();};
}

void cross (){
 stroke(0,255,0);
 noFill();
 strokeWeight(4);
 ellipse(mouseX, mouseY, 75,75);
 strokeWeight(2);
 line(0, mouseY, mouseX-50, mouseY);
 line(displayWidth, mouseY, mouseX+50, mouseY);
 line(mouseX, 0, mouseX, mouseY-50);
 line( mouseX,displayHeight, mouseX, mouseY+50); 
}
void mousePressed() {
  if(focused){
    background(0,0,0);
    focused =false; 
  }else{
   focused = true; 
  }
}
void keyPressed(){
 if( key==' ' && show){
   show=false; 
 } else{
   show=true;
 }
}


