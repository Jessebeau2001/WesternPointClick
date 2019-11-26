

class churchInsideScene {
  PImage backGround;
  
  gameObject arrowOutside = new gameObject(width/2, height-150, 120, 150, "arrowDown.png", false);
  
  churchInsideScene() {
    backGround = loadImage("churchInsideScene.png");
    arrowOutside.setup();
  }
  
  void run() {
    display();
    arrowOutside.draw();
  }
  
  void display() {
    image(backGround, 0, 0, width, height);
  }
  
}
