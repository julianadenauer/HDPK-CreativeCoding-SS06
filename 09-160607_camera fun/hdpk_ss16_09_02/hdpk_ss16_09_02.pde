// import the video library. you might need to install it first: 
// 1) sketch -> import library -> add library
// 2) install "Video | GStreamer-based video library for Processing"
import processing.video.*;
Capture cam;

// make list of images to save the frames
PImage[] images;

int imageNumber = 0;
int filterNumber = 0;

void setup(){
  size(1280, 720);
  
  // get a list of all connected cameras
  String[] cameras = Capture.list();
  
  // output the list of cameras to the console
  for(int i = 0; i< cameras.length; i++){
    println(cameras[i]);
  }
  
  // initialize the image list
  images = new PImage[10];
  for(int i = 0; i< images.length; i++){
    images[i] = createImage(width, height, RGB);
  }
  
  // initlize the first camera
  cam = new Capture(this, cameras[0]);
  cam.start();
}

void draw(){
  // update the camera frame if the camera is ready
  if(cam.available()){
    cam.read();
    
    if(filterNumber == 1){
      cam.filter(GRAY);
    } else if (filterNumber == 2){
      cam.filter(INVERT);
    } else if (filterNumber == 3){
      cam.filter(POSTERIZE, 4);
    }
  }

  // draw the image onto the screen
  image(cam, 0, 0);
  
  // draw the last images at the bottom of the screen
  for(int i = 0; i< images.length; i++){
    image(images[i], i*128, height - 72, 128, 72);
  }
  
}

void keyPressed(){
  if(key == ' '){
    // save the image into a PImage Object
    images[imageNumber].copy(cam, 0, 0, width, height, 0, 0, width, height);
    imageNumber++;
    if(imageNumber == 10) imageNumber = 0;
    
    delay(100);
  }
  if(key == '0') filterNumber = 0;
  if(key == '1') filterNumber = 1;
  if(key == '2') filterNumber = 2;
  if(key == '3') filterNumber = 3;
 
}