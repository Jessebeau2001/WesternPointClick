
class streetScene {
  PImage background, sign_broken, sign_build, sign;

  int animationWait = 30;
  int currentFrame;

  String itemPressed = "firstTime";
  int timer = 0;
  
  gameObject arrowBar = new gameObject(1410, 750, 120, 150, "arrowUp.png", false);
  gameObject arrowGate = new gameObject(width/2 - 75, height-170, 120, 150, "arrowDown.png", false);
  gameObject arrowChurch = new gameObject(0, height/2, 150, 120, "arrowLeft.png", false);
  gameObject arrowBank = new gameObject(width-150, height/2, 150, 120, "arrowRight.png", false);
  gameObject brokenSign = new gameObject(10, 888 - 377, 259 , 377, "sign_broken.png", false);
  gameObject boots = new gameObject(556, 884, 110, 150, "slot.png", false);
  gameObject gun = new gameObject(1658, 872, 150, 75, "slot.png", false);
  dialog dialog = new dialog();

  boolean signRepaired = false;
  boolean firstAnim = true;
  boolean firstTime = true;
  boolean dialogActive = true;
  boolean doOnce = true;
  
  streetScene() {
    background = loadImage("StreetScene.png");
    sign_build = loadImage("sign_build.png");
    sign_broken = loadImage("sign_broken.png");
    sign = loadImage("sign.png");
    arrowBar.setup();
    arrowGate.setup();
    arrowChurch.setup();
    arrowBank.setup();
    brokenSign.setup();
    boots.setup();
    gun.setup();
  }
  
  void run() {
    display();
    arrowBar.draw();
    arrowGate.draw();

    if (signRepaired) {
      repairSign();
    } else {
      brokenSign.draw();
      //image(sign_broken, 10, 888 - sign_broken.height);
    }

    if(boots.clicked()) {
      itemPressed = "boots";
      timer = 0;
    }
    if(gun.clicked()) {
      itemPressed = "gun";
      timer = 0;
    }
    
    switch(itemPressed) {
      case "firstTime":
        dialog.changeText("the rumors where true, there is nobody...", "maybe I can find something in the saloon.");
        dialog.run();
        dialogActive =true;
        break;
      case "paper":
        dialog.changeText("Hmmm..., what could this number mean?", "");
        dialog.run();
        if (doOnce) {
          timer = 0;
          doOnce = false;
        }
        break;
      case "noHammer":
        dialogActive = true;
        dialog.changeText("A broken sign, ", "maybe I could repair it if I had the right tools");
        dialog.run();
        if (doOnce) {
          timer = 0;
          doOnce = false;
        }
        break;
      case "boots":
        dialog.changeText("Not a bad pair if I do say so myself. ", "Not that anyone wore them recently.");
        dialog.run();
        break;
      case "gun":
        dialog.changeText("It still has some bullets in it. Guess someone dropped it", "in a rush.");
        dialog.run();
      default:
        dialogActive = false;
        break;
    }
    
    timer++;
    if (timer > 30) {
      if(keyPressed || mousePressed) {
        firstTime = false;
        itemPressed = "";
        doOnce = true;
      }
    }
  }
  
  void display() {
    image(background, 0, 0, width, height);
  }

  void repairSign() {
    println("firstAnim: "+firstAnim);
    if (firstAnim) {
      firstAnim = false;
      currentFrame = frameCount;
    }
    if (currentFrame + animationWait > frameCount) {
      image(sign_build, 10, 888 - sign_build.height);
    } else {
      image(sign, 10, 888 - sign.height);
      arrowChurch.draw();
      arrowBank.draw();
    }
  }
}
