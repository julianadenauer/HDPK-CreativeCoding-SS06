PVector position;
float rotation = 0;

void setup(){
  size(400, 400);
  
  // start in the center
  position = new PVector(width/2, height/2);
  
  noFill();
  stroke(0, 20);
  strokeWeight(0.2);
}

void draw(){
  translate(position.x, position.y);
  rotate(radians(rotation));
  
  // draw hexagon
  beginShape();
  scale(10);
  vertex(-5, -10);
  vertex(5, -10);
  vertex(11, 0);
  vertex(5, 10);
  vertex(-5, 10);
  vertex(-11, 0);
  endShape(CLOSE);
  
  PVector mouse = new PVector(mouseX, mouseY);
  mouse.sub(position);
  mouse.setMag(2);
  position.add(mouse);
    
  rotation += 1;
}