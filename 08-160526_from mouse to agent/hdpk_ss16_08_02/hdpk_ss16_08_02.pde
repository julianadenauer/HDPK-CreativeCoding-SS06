float thickness = 2;
int r = 0;
int g = 0;
int b = 0;
int brush = 1;

void setup(){
  size(400, 400);
  background(255); // white background
}

void draw(){
  // check for keys
  if(keyPressed){
    if(key == 'r'){
      r++;
    }
    if(key == 'g'){
      g++;
    }
    if(key == 'b'){
      b++;
    }
    if(key == 't'){
      thickness += 0.01;
    }
    
    
    if(r > 255) r = 0;
    if(g > 255) g = 0;
    if(b > 255) b = 0;
    if(thickness > 10) thickness = 2;
  }
  
  // draw interface
  fill(r, g, b);
  noStroke();
  rect(0, 0, 150, 22);
  fill(255);
  text(r+ ", " + g + ", " + b, 5, 15);
  text(thickness, 100, 15);
}

void mouseDragged(){
  stroke(r, g, b, 50);
  strokeWeight(thickness);
  
  if(brush == 1){
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if(brush == 2){
    strokeWeight(thickness / 10);
    ellipse(mouseX, mouseY, thickness, thickness);
  }
  if(brush == 3){
    noFill();
    pushMatrix();
    translate(mouseX, mouseY);
    
    // draw hexagon
    beginShape();
    vertex(-5, -10);
    vertex(5, -10);
    vertex(11, 0);
    vertex(5, 10);
    vertex(-5, 10);
    vertex(-11, 0);
    endShape(CLOSE);
    popMatrix();
  }
}

void keyReleased(){
  if(key == BACKSPACE){
    background(255);
  }
  if(key == 's' || key == 'S'){
    saveFrame();
    println("saved!");
  }
  if(key == '1'){
    brush = 1;
  }
  if(key == '2'){
    brush = 2;
  }
  if(key == '3'){
    brush = 3;
  }
}