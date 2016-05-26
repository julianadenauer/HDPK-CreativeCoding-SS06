PVector position;
float rotation = 0;
float thickness = 50;
float thickness_change = 0.5;

void setup(){
  size(400, 400);
  
  // start in the center
  position = new PVector(width/2, height/2);
  
  noFill();
  stroke(0, 50);
  strokeWeight(0.2);
}

void draw(){
  translate(position.x, position.y);
  rotate(radians(rotation));
  
  // draw bezier
  bezier(-100, 0, -100, thickness, 100, thickness, 100, 0);
  bezier(-100, 0, -100, -thickness, 100, -thickness, 100, 0);
  
  PVector mouse = new PVector(mouseX, mouseY);
  mouse.sub(position);
  mouse.setMag(2);
  position.add(mouse);
    
  rotation += 1;
  thickness += thickness_change;
  if(thickness > 150) thickness_change = -thickness_change;
  if(thickness < 50) thickness_change = -thickness_change;
}