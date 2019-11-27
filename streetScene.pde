
class streetScene {
  PImage background, sign_broken, sign;
  
  gameObject arrowBar = new gameObject(1400, 750, 80, 120, "arrowUpAlt.png", false);
  gameObject arrowGate = new gameObject(1100, 800, 120, 150, "arrowDown.png", false);
  gameObject arrowChurch = new gameObject(0, height/2, 150, 120, "arrowLeft.png", false);
  gameObject arrowBank = new gameObject(width-150, height/2, 150, 120, "arrowRight.png", false);

  boolean signRepaired = false;
  
  streetScene() {
    background = loadImage("StreetScene.png");
    sign_broken = loadImage("sign_broken.png");
    sign = loadImage("sign.png");
    arrowBar.setup();
    arrowGate.setup();
    arrowChurch.setup();
    arrowBank.setup();
  }
  
  void run() {
    display();
    arrowBar.draw();
    arrowGate.draw();

    if (signRepaired) {
      arrowChurch.draw();
      arrowBank.draw();
      image(sign, 10, 888 - sign.height);
    } else {
      image(sign_broken, 10, 888 - sign_broken.height);
    }


  }
  
  void display() {
    image(background, 0, 0, width, height);
  }
}