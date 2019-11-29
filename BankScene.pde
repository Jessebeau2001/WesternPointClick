
class bankScene {
  PImage backGround;
  int timer;
  boolean firstTime = true;
  String itemPressed = "";
  
  gameObject arrowBank = new gameObject(1450, 750, 120, 150, "arrowUp.png", false);
  gameObject arrowStreet = new gameObject(0, height/2+200, 150, 120, "arrowLeft.png", false);
  gameObject arrowFenceScene = new gameObject(1700, 650, 150, 120, "arrowRight.png", false);
  gameObject guitar = new gameObject(1156, 764, 100, 200, "slot.png", false);
  gameObject money = new gameObject(1429, 925, 70, 25, "slot.png", false);

  dialog dialog = new dialog();
  
  bankScene() {
    backGround = loadImage("bankScene.png");
    arrowBank.setup();
    arrowStreet.setup();
    arrowFenceScene.setup();
    guitar.setup();
    money.setup();
  }
  
  void run() {
    display();
    arrowBank.draw();
    arrowStreet.draw();
    arrowFenceScene.draw();

    if (guitar.clicked()) {
      itemPressed = "guitar";
      timer = 0;
    }
    if (money.clicked()) {
      itemPressed = "money";
      timer = 0;
    }

    switch(itemPressed) {
      case "first":
        dialog.changeText("if I where a bandit...?", "I would go to the bank!");
        dialog.run();
        break;
      case "guitar":
        dialog.changeText("The strings are snapped, it’s been a while since it has", "seen its owner. Wonder what it sounded like...");
       dialog.run();
        break;
      case "money":
        dialog.changeText("Why is there money on the ground? I guess the bandits ", "were in a rush, who’s to say it’s their money though.");
        dialog.run();
        break;
    }

    if (firstTime) {
      itemPressed = "first";
    }

    if (timer < 35) {
      timer++;
    }

    if (timer > 30) {
      if(keyPressed || mousePressed) {
        firstTime = false;
        itemPressed = "";
      }
    }
  }
  
  void display() {
    image(backGround, 0, 0);
  }
  
}
