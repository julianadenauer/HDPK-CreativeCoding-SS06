import processing.sound.*;

AudioIn input;
Amplitude amp;

float sum_band1 = 0;
float sum_band2 = 0;

// program state
int state = 0;

int xPosition = 0;
float lastAmplitude = 0;
float currentAmplitude = 0;

void setup() {
    size(640,360);
    background(255);
    
    // initialize microphone
    input = new AudioIn(this, 0);
    input.start();
    
    // initialize amplitude analysis
    amp = new Amplitude(this);
    amp.input(input);
    
    fill(0);
    text("band 1", 10, 15);
}

void draw(){
  
  // record applause for band 1
  if(state == 0){
    currentAmplitude = amp.analyze();
    sum_band1 += currentAmplitude;
    
    line(xPosition - 1, height - lastAmplitude * 1000, xPosition, height - currentAmplitude * 1000);
    
    xPosition++;
    lastAmplitude = currentAmplitude;
    
    if(xPosition > width){
      background(255);
      xPosition = 0;
      state = 1;
      
      text("band 2", 10, 15);
    }
  }
  
  // record applause for band 2
  else if (state == 1){
    currentAmplitude = amp.analyze();
    sum_band2 += currentAmplitude;
    
    line(xPosition - 1, height - lastAmplitude * 1000, xPosition, height - currentAmplitude * 1000);
    
    xPosition++;
    lastAmplitude = currentAmplitude;
    
    if(xPosition > width){
      xPosition = 0;
      state = 2;
    }
  }
  
  // show the results
  else if (state == 2){
    if(sum_band1 > sum_band2){
      fill(0, 255, 0);
      rect(0, 0, width/2, height);
      fill(255, 0, 0);
      rect(width/2, 0, width, height);
    }
    else{
      fill(255, 0, 0);
      rect(0, 0, width/2, height);
      fill(0, 255, 0);
      rect(width/2, 0, width, height);
    }
    
    fill(0);
    text(sum_band1, 10, 15);
    text(sum_band2, width/2 + 10, 15);
  }
}