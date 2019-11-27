
class streetScene {
  PImage background, sign_broken, sign_build, sign;

  int animationWait = 30;
  int currentFrame;
  
  gameObject arrowBar = new gameObject(1400, 750, 80, 120, "arrowUpAlt.png", false);
  gameObject arrowGate = new gameObject(1100, 800, 120, 150, "arrowDown.png", false);
  gameObject arrowChurch = new gameObject(0, height/2, 150, 120, "arrowLeft.png", false);
  gameObject arrowBank = new gameObject(width-150, height/2, 150, 120, "arrowRight.png", false);

  boolean signRepaired = false;
  boolean firstAnim = true;
  
  streetScene() {
    background = loadImage("StreetScene.png");
    sign_build = loadImage("sign_build.png");
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
      repairSign();
    } else {
      image(sign_broken, 10, 888 - sign_broken.height);
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
    println("currentFrame: "+currentFrame);
    println("frameCount: "+frameCount);
    if (currentFrame + animationWait > frameCount) {
      image(sign_build, 10, 888 - sign_build.height);
    } else {
      image(sign, 10, 888 - sign.height);
      arrowChurch.draw();
      arrowBank.draw();
    }
  }
}