float thickness = 2;
float h = 0;
float s = 50;
float b = 100;

int imgNumber = 0;

void setup(){
  size(400, 400);
  colorMode(HSB, 100, 100, 100);
  background(0, 0, 100); // white background
}

void draw(){
  // check for keys
  if(keyPressed){
    if(key == 'h'){
      h+=0.5;
    }
    if(key == 's'){
      s+=0.5;
    }
    if(key == 'b'){
      b++;
    }
    if(key == '+'){
      thickness += 0.05;
    }
    if(key == '-' && thickness > 0.05){
      thickness -= 0.05;
    }
    
    if(h > 100) h = 0;
    if(s > 100) s = 0;
    if(b > 100) b = 0;
  }
  
  // draw interface
  noStroke();
  fill(h, s, b);
  rect(0, 0, 150, 22);
  fill(0, 0, 100); // white text
  text(round(h)+ ", " + round(s) + ", " + round(b), 5, 15);
  text(round(thickness), 100, 15);
}

void mouseDragged(){
  stroke(h, s, b);
  strokeWeight(thickness);
  line(pmouseX, pmouseY, mouseX, mouseY);  
}

void keyReleased(){
  if(key == BACKSPACE){
    saveFrame("image-" + imgNumber + ".png");
    imgNumber++;
    println("saved image " + imgNumber + "!");
    background(0, 0, 100); // white background
  }
  if(key == 's' || key == 'S'){
    saveFrame();
    
  }
}