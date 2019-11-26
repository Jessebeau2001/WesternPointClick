
class bankInsideScene {
  PImage backGround1;
  PImage backGround2;
  boolean isSafeOpen = false;

  gameObject arrowOutside = new gameObject(width-150, 500, 150, 120, "arrowRight.png", false);

  bankInsideScene() {
    backGround1 = loadImage("bankInsideScene.png");
    backGround2 = loadImage("bankInsideSceneOpen.png");
    arrowOutside.setup();
  }

  void run() {
    if (isSafeOpen) {
      image(backGround2, 0, 0);
    } else {
      image(backGround1, 0, 0);
    }

    arrowOutside.draw();

    if (dist(mouseX, mouseY, height/2, 300) < 200 && mousePressed) {
      isSafeOpen = true;
    }
  }
}
