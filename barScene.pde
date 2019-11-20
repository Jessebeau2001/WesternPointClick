
class barScene {
  PImage background;
  
  gameObject arrowStreet = new gameObject(500, 500, 100, 100, "arrowDown.png");
  
  barScene() {
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
