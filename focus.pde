boolean focus= true; //focus or break
boolean showRept=false; // show green aim reticle 
String currentTime=null; 
int pmin=minute(); //alternate "previous" minute holder variable

void setup() {
  size(1500,800); //this new function is pretty cool
  textAlign(CENTER, CENTER); //text coordinates are centered default was (LEFT, BASELINE)
  if (minute()>=50) { //needed for initializing if not true
    focus=false;
  }
}

void draw() {
  if (pmin==49 && minute()==50) { // trust me, you need this
    background(0); 
  }
  if (pmin!=minute()) { 
    pmin=minute();
  }
  if (minute()<50) {
    focus=true;
  } else {
    focus=false;
  }; 
  textSize(70); 
  if (focus) {
    fill(0, 0, 0, 20);          //these two lines form
    rect(0, 0, width, height);   //a "fading" background
    fill(255, 0, 0);
    text("FOCUSED", width/2, height/2);
    textSize(30);
    text(time(), width/2, height/2 +50);
  } else {
    fill(255, 0, 0, 20);
    rect(0, 0, width, height);
    fill(0, 0, 0);
    text("BREAK", width/2, height/2);
    textSize(30);
    text(time(), width/2, height/2 +50);
  }
  if (showRept) {
    cross();
  };
}

String time() { //returns complete time string
  String time=" AM";
  int hr=hour();
  String m=str(minute());
  String s=str(second());
  if (hr>12 || hr==0) {
    hr=abs(hr-12); 
    time=" PM";
  } else {
    time=" AM";
  };
  if (minute()<10) {
    m="0"+m;
  };
  if (second()<10) {
    s="0"+s;
  }
  return hr+":"+ m+":"+s+time;
}

void cross () {          //   aiming repticle  
  stroke(0, 255, 0);     //        |
  noFill();              //     -- O --
  strokeWeight(4);       //        |
  ellipse(mouseX, mouseY, 75, 75);
  strokeWeight(2);
  line(0, mouseY, mouseX-50, mouseY);
  line(width, mouseY, mouseX+50, mouseY);
  line(mouseX, 0, mouseX, mouseY-50);
  line( mouseX, height, mouseX, mouseY+50);
}
void keyPressed() {
  if ( key==' ' && showRept) {
    showRept=false;
  } else {
    showRept=true;
  }
}
/*void mousePressed() {
 if(focus){
 background(0,0,0);
 focus =false; 
 }else{
 focus = true; 
 }
 }*/
