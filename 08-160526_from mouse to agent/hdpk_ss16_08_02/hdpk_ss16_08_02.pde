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
      thickness += 0.05;
    }
    
    
    if(r > 255) r = 0;
    if(g > 255) g = 0;
    if(b > 255) b = 0;
    if(thickness > 50) thickness = 2;
  }
  
  // draw interface
  fill(r, g, b);
  noStroke();
  rect(0, 0, 180, 22);
  fill(255);
  text(r+ ", " + g + ", " + b, 5, 15);
  text(thickness, 100, 15);
  text(brush, 150, 15);
}

void mouseDragged(){ 
  if(brush == 1){
    stroke(r, g, b);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if(brush == 2){
    noFill();
    stroke(r, g, b, 80);
    strokeWeight(0.8);
    ellipse(mouseX, mouseY, thickness, thickness);
  }
  if(brush == 3){
    noFill();
    stroke(r, g, b, 100);
    strokeWeight(0.5);
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
  if(brush == 4){
    fill(r, g, b, 50);
    noStroke();
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(PI/4);
    bezier(-thickness, 0, -thickness, thickness/2, thickness, thickness/2, thickness, 0);
    bezier(-thickness, 0, -thickness, -thickness/2, thickness, -thickness/2, thickness, 0);
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
  if(key == '4'){
    brush = 4;
  }
}