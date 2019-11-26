

class churchScene {
  PImage backGround;

  gameObject arrowStreet = new gameObject(width-150, height/2 + 200, 150, 120, "arrowRight.png", false);
  gameObject arrowInside = new gameObject(width/2-50, 625, 120, 150, "arrowDown.png", false);
  
  churchScene() {
    backGround = loadImage("churchScene.png");
    arrowStreet.setup();
    arrowInside.setup();
  }
  
  void run() {
    display();
    arrowStreet.draw();
    arrowInside.draw();
  }
  
  void display() {
    image(backGround, 0, 0, width, height);
  }
}
