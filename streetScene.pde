
class streetScene {
  PImage background;
  
  gameObject arrowBar = new gameObject(500, 500, 100, 100, "arrowDown.png", false);
  gameObject arrowGate = new gameObject(800, 900, 100, 100, "arrowDown.png", false);
  
  streetScene() {
    background = loadImage("StreetScene.png");
    arrowBar.setup();
    arrowGate.setup();
  }
  
  void run() {
    display();
    arrowBar.draw();
    arrowGate.draw();
  }
  
  void display() {
    image(background, 0, 0, width, height);
  }
}



//class 
