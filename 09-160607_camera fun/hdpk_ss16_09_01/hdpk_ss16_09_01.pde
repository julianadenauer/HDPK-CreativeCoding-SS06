// import the video library. you might need to install it first: 
// 1) sketch -> import library -> add library
// 2) install "Video | GStreamer-based video library for Processing"
import processing.video.*;

Capture cam;

void setup(){
  size(1280, 720);
  
  // get a list of all connected cameras
  String[] cameras = Capture.list();
  
  // output the list of cameras to the console
  for(int i = 0; i< cameras.length; i++){
    println(cameras[i]);
  }
  
  // initlize the first camera
  cam = new Capture(this, cameras[0]);
  cam.start();
}

void draw(){
  // update the camera frame if the camera is ready
  if(cam.available()){
    cam.read();  
  }

  // draw the image onto the screen
  image(cam, 0, 0);
}