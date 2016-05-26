PVector position;
PVector direction;
int diameter = 1;

void setup(){
  size(400, 400);
  
  // start in the center
  position = new PVector(width/2, height/2);
  direction = new PVector(1, 0);
  
  fill(0, 40);
  noStroke();
  background(255);
}

void draw(){
  for(int i= 0; i < 100; i++){
    ellipse(position.x, position.y, diameter, diameter);
    
    // move the position
    position.add(direction);
    
    // take care that it doesn't fall off the canvas
    if(position.x > width) position.x = 0;
    if(position.x < 0) position.x = width;
    if(position.y > height) position.y = 0;
    if(position.y < 0) position.y = height;
    
    // change the direction
    int n = (int) random(0, 3);
    direction.rotate(n * PI/4.0);
  }
}