
class gateScene {
  PImage background;
  boolean firstTime = true;
  
  gameObject arrowStreet = new gameObject(width/2-50, 700, 100, 100, "arrowUp.png", false);
  dialog dialog = new dialog();
  
  gateScene() {
    background = loadImage("FrontGate.png");
    arrowStreet.setup();
  }
  
  void run() {
    display();
    arrowStreet.draw();
    
    if (firstTime) {
      dialog.changeScene(0);
      dialog.run();
      if (keyPressed) {
        firstTime = false;
      }
    }
  }
  
  void display() {
    image(background, 0, 0, width+50, height+50);
  }  
}
