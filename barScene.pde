
class barScene {  
  PImage background;
  boolean dialogActive, doOnce;
  String itemPressed = "";
  int timer;

  gameObject arrowStreet = new gameObject(width - 200, height/2-200, 150, 120, "arrowRight.png", false);
  gameObject arrowPuzzle = new gameObject(300, 650, 80, 100, "arrowDown.png", false);
  fishBowlPuzzle puzzle;
  dialog dialog = new dialog();

  barScene() {
    background = loadImage("BarScene.png");
    arrowStreet.setup();
    arrowPuzzle.setup();
  }

  void run() {
    display();
    arrowStreet.draw();
    arrowPuzzle.draw();

    switch(itemPressed) {
    case "paper":
      dialog.changeText("AH YES! there is something behind the bottles", "what does it mean?");
      dialog.run();
      dialogActive = true;
      if (doOnce) {
        timer = 0;
        doOnce = false;
      }
      break;
    default:
      dialogActive = false;
      break;
    }

    timer++;
    if (timer > 30) {
      if (keyPressed || mousePressed) {
        itemPressed = "";
        doOnce = true;
      }
    }
  }

  void display() {
    image(background, 0, 0, width, height);
  }
}
