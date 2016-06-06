// import the video library. you might need to install it first: 
// 1) sketch -> import library -> add library
// 2) install "Video | GStreamer-based video library for Processing"
import processing.video.*;
Capture cam;

float maxBrightness = 0;
int maxBrightnessX = -1;
int maxBrightnessY = -1;

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

  background(0);
  noFill();
  strokeWeight(5);
}

void draw() {
  background(0);
  // update the camera frame if the camera is ready
  if (cam.available()) {
    cam.read();
  }
  
  image(cam, 0, 0);

  for (int y=0; y<height; y++) {
    for (int x = 0; x < width; x++) {
      color c = cam.get(x, y);
      if (brightness(c) > maxBrightness) {
        maxBrightness = brightness(c);
        maxBrightnessX = x; 
        maxBrightnessY = y;
      }
    }
  }

  stroke(255, 0, 0);
  ellipse(maxBrightnessX, maxBrightnessY, 20, 20);
  
  maxBrightness = 0;
}