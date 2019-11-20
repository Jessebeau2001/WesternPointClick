
class gateScene {
  PImage background;
  
  gameObject arrowStreet = new gameObject(width/2-100, 600, 100, 100, "arrowDown.png");
  
  gateScene() {
    background = loadImage("FrontGate.png");
    arrowStreet.setup();
  }
  
  void run() {
    display();
    arrowStreet.draw();
  }
  
  void display() {
    image(background, 0, 0, width, height);
  }
  
}
