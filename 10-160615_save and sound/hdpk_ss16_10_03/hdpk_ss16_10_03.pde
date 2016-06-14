import processing.sound.*;

AudioIn input;
Amplitude amp;

void setup() {
    size(640,360);
    background(255);
    
    //Load a soundfile and play it
    input = new AudioIn(this, 0);
    input.start();
    
    // initialize amplitude analysis
    amp = new Amplitude(this);
    amp.input(input);
}

void draw(){
  background(201);
  rect(10, 10, amp.analyze()* 5000, 340);  
}