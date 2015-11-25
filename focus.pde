boolean focus; //focus or break
boolean showRept=false; // show green aim reticle 
int pmin=minute(); //alternate "previous" minute holder variable

void setup() {
  //fullScreen(); //this new function is pretty cool but doesn't work in js
  size(800, 500); 
  textAlign(CENTER, CENTER); //text coordinates are centered default was (LEFT, BASELINE)
  }

void draw() {
  if (pmin==49 && minute()==50) { // senses when minute changes
    background(0); // try running without this, text can be seen behind red break bg
  }
  if (pmin!=minute()) { //sets pmin to minute when minute value changes
    pmin=minute();
  }
  focus=(minute()<50)? true : false;
  textSize(70); 
  if (focus) {
    fill(0, 0, 0, 20);          //these two lines code for
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

String time() {             //returns complete time string
  int hr=(hour()+11)%12+1;
  String m=(minute()<10)? "0"+str(minute()) : str(minute()); //if(minute()<10){m="0"+m;}
  String s=(second()<10)? "0"+str(second()) : str(second()); //if(second()<10){s="0"+s;}
  String time = (hour()>=12)? " PM" : " AM";
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
  line( mouseX, displayHeight, mouseX, mouseY+50);
}
void keyPressed() {
  if ( key==' ' && showRept) {
    showRept=false;
  } else {
    showRept=true;
  }
}
