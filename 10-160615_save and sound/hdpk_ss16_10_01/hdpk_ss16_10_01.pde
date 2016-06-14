import processing.sound.*;

SoundFile soundfile;

void setup() {
    size(640,360);
    background(255);
    
    //Load a soundfile
    soundfile = new SoundFile(this, "vibraphon.aiff");
    
    soundfile.loop();
}

void draw(){
  // Map mouseX from 0.25 to 4.0 for playback rate. 1 equals original playback 
  // speed 2 is an octave up 0.5 is an octave down.
  soundfile.rate(map(mouseX, 0, width, 0.25, 4.0));
  
  // Map mouseY from -1.0 to 1.0 for left to right
  soundfile.pan(map(mouseY, 0, width, -1.0, 1.0));
}