class churchInsideScene {
  PImage backGround;
  
  gameObject arrowOutside = new gameObject(width/2-50, 750, 120, 150, "arrowDown.png", false);
  gameObject bible = new gameObject(width/2, 600, 300 , 170, "bible.png", false);

  churchInsideScene() {
    backGround = loadImage("churchInsideScene.png");
    arrowOutside.setup();
    bible.setup();
  }
  
  void run() {
    display();
    arrowOutside.draw();
    bible.draw();
  }
  
  void display() {
    image(backGround, 0, 0, width, height);
  }
  
}