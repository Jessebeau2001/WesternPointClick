
class barScene {
  PImage background;
  
  gameObject arrowStreet = new gameObject(width - 200, 600, 100, "arrowDown.png", false);
  
  barScene() {
    background = loadImage("BarScene.png");
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
