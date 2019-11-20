
class streetScene {
  
  PImage background;
  String scene = "streetScene";
  String nextScene = null;
  
  gameObject arrowBar = new gameObject(500, 500, 100, 100, "arrowDown.png");
  gameObject arrowGate = new gameObject(800, 900, 100, 100, "arrowDown.png");
  
  streetScene() {
    background = loadImage("StreetScene.png");
    arrowBar.setup();
    arrowGate.setup();
  }
  
  void run() {
    display();
    arrowBar.draw();
    arrowGate.draw();
    
    //if(arrowBar.pressed()) {
    //  nextScene = "barScene";
    //} else if(arrowGate.pressed()) {
    //  nextScene = "gateScene";
    //}
  }
  
  void display() {
    image(background, 0, 0, width, height);
  }
  
}
