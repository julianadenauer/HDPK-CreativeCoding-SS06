// import the video library. you might need to install it first: 
// 1) sketch -> import library -> add library
// 2) install "Video | GStreamer-based video library for Processing"
import processing.video.*;
Capture cam;

void setup() {
  size(1280, 720);

  // get a list of all connected cameras
  String[] cameras = Capture.list();

  // output the list of cameras to the console
  for (int i = 0; i< cameras.length; i++) {
    println(cameras[i]);
  }

  // initlize the first camera
  cam = new Capture(this, cameras[0]);
  cam.start();
  
  noStroke();
  background(0);
}

void draw() {
  background(0);
  // update the camera frame if the camera is ready
  if (cam.available()) {
    cam.read();
  }

  for (int y=0; y<height; y+=15) {
    for (int x = 0; x < width; x+=15) {
      color c = cam.get(x, y);
      int diameter = round(map(brightness(c), 0, 255, 0, 15));
      //fill(c);
      ellipse(x, y, diameter, diameter);  
    }    
  }
}