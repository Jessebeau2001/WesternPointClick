
class gateScene {
  PImage background;
  
  gameObject arrowStreet = new gameObject(width/2-50, 700, 100, 100, "arrowUp.png", false);
  
  gateScene() {
    background = loadImage("FrontGate.png");
    arrowStreet.setup();
  }
  
  void run() {
    display();
    arrowStreet.draw();
  }
  
  void display() {
    image(background, 0, 0, width+50, height+50);
  }  
}
