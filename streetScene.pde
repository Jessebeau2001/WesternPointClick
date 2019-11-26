
class streetScene {
  PImage background;
  
  gameObject arrowBar = new gameObject(1400, 750, 120, 150, "arrowUp.png", false);
  gameObject arrowGate = new gameObject(1100, 800, 120, 150, "arrowDown.png", false);
  gameObject arrowChurch = new gameObject(0, height/2, 150, 120, "arrowLeft.png", false);
  gameObject arrowFence = new gameObject(width-150, height/2, 150, 120, "arrowRight.png", false);
  
  streetScene() {
    background = loadImage("StreetScene.png");
    arrowBar.setup();
    arrowGate.setup();
    arrowChurch.setup();
    arrowFence.setup();
  }
  
  void run() {
    display();
    arrowBar.draw();
    arrowGate.draw();
    arrowChurch.draw();
    arrowFence.draw();
  }
  
  void display() {
    image(background, 0, 0, width, height);
  }
}



//class 
