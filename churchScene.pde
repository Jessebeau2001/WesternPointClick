

class churchScene {
  PImage backGround;
  
  gameObject arrowStreet = new gameObject(width-150, height/2, 150, 120, "arrowRight.png", false);
  
  churchScene() {
    backGround = loadImage("churchScene.png");
    arrowStreet.setup();
  }
  
  void run() {
    display();
    arrowStreet.draw();
  }
  
  void display() {
    image(backGround, 0, 0, width, height);
  }
}
