
class bankScene {
  PImage backGround;
  
  gameObject arrowBank = new gameObject(1450, 750, 120, 150, "arrowUp.png", false);
  gameObject arrowStreet = new gameObject(0, height/2+200, 150, 120, "arrowLeft.png", false);
  
  bankScene() {
    backGround = loadImage("bankScene.png");
    arrowBank.setup();
    arrowStreet.setup();
  }
  
  void run() {
    display();
    arrowBank.draw();
    arrowStreet.draw();
  }
  
  void display() {
    image(backGround, 0, 0);
  }
  
}
