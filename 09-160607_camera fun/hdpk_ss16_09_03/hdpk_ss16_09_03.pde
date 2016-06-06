// import the video library. you might need to install it first: 
// 1) sketch -> import library -> add library
// 2) install "Video | GStreamer-based video library for Processing"
import processing.video.*;
Capture cam;

// make list of images to save the frames
PImage[] images;

int mode = 0;
int imageNumber = 0;
int filterNumber = 0;
int lastImage = 0;
int imageCaptureDelay = 500;
int imageDisplayDelay = 100;

void setup() {
  size(1280, 720);

  // get a list of all connected cameras
  String[] cameras = Capture.list();

  // output the list of cameras to the console
  for (int i = 0; i< cameras.length; i++) {
    println(cameras[i]);
  }

  // initialize the image list
  images = new PImage[10];
  for (int i = 0; i< images.length; i++) {
    images[i] = createImage(width, height, RGB);
  }

  // initlize the first camera
  cam = new Capture(this, cameras[0]);
  cam.start();
  
  noFill();
}

void draw() {
  // update the camera frame if the camera is ready
  if (cam.available()) {
    cam.read();

    if (filterNumber == 1) {
      cam.filter(GRAY);
    } else if (filterNumber == 2) {
      cam.filter(INVERT);
    } else if (filterNumber == 3) {
      cam.filter(POSTERIZE, 4);
    }
  }

  // in mode 0 draw the live image
  if (mode == 0) {
    // draw the image onto the screen
    image(cam, 0, 0);
  }
  // in mode 1, capture images
  if (mode == 1) {
    // draw the live image
    image(cam, 0, 0);
    
    // capture an image if the last capture if enough time has passed 
    if (millis() - lastImage > imageCaptureDelay) {
      
      // save the image into a PImage Object
      images[imageNumber].copy(cam, 0, 0, width, height, 0, 0, width, height);
      imageNumber++;
      lastImage = millis();

      // reset the counter and go to display mode after capturing 10 frames
      if (imageNumber == 10) {
        imageNumber = 0;
        mode = 2;
        println("captured 10 images");
      }
    }
    else if(millis() - lastImage < 100){
      // draw a frame a few milliseconds after the last capture
      strokeWeight(50);
      stroke(255);
      rect(0, 0, width, height);
    }
    
  }

  // in mode 2, display the last gif
  if ( mode==2 ) {
    image(images[imageNumber], 0, 0);
    if (millis() - lastImage > imageDisplayDelay) {
      lastImage = millis();
      imageNumber++;
      if (imageNumber == 10) imageNumber = 0;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    imageNumber = 0;
    mode = 1;
  }
  if (key == 's') {
    // save all 10 images
    for(int i = 0; i<10; i++){
      images[i].save("image-" + i + ".jpg");
    }
  }
  if (key == '0') filterNumber = 0;
  if (key == '1') filterNumber = 1;
  if (key == '2') filterNumber = 2;
  if (key == '3') filterNumber = 3;
}