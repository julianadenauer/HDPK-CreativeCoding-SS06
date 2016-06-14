import processing.sound.*;

SinOsc sine, sine2;
Env env; 

float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.2;

void setup() {
  size(640, 360);
  background(255);

  sine = new SinOsc(this); 
  
  //sine2 = new SinOsc(this); 
  //sine2.play();
  
  env  = new Env(this);
}

void draw(){
  //sine.freq(map(mouseX, 0, width, 80.0, 1000.0));
  //sine2.freq(map(mouseX, 0, width, 100.0, 1000.0));
  
  
}

void keyPressed(){
  sine.play();
  env.play(sine, attackTime, sustainTime, sustainLevel, releaseTime);
}