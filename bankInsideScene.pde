
class bankInsideScene {
  PImage backGround1;
  PImage backGround2;
  int timer = 0;
  boolean isSafeOpen = false;
  boolean allPapers = false;
  String itemPressed = "";

  gameObject arrowOutside = new gameObject(width-150, 500, 150, 120, "arrowRight.png", false);
  dialog dialog = new dialog();
  bankPuzzle puzzle = new bankPuzzle();

  bankInsideScene() {
    backGround1 = loadImage("bankInsideScene.png");
    backGround2 = loadImage("bankInsideSceneOpen.png");
    arrowOutside.setup();
  }

  void run() {    
    if (isSafeOpen) {
      image(backGround2, 0, 0);
      itemPressed = "safeOpen";
    } else {
      image(backGround1, 0, 0);
    }

    if (timer < 35) {
      timer++;
    }

    arrowOutside.draw();
    dialogue();
  }
  
  void dialogue() {
    switch(itemPressed) {
      case "paper":
        dialog.changeText("Another piece of paper...", "are these maybe for the safe?");
        dialog.run();
        break;
      case "safeLocked":
        dialog.changeText("hmmm...., I need a code to open this.", "Maybe I can find it somewhere in town.");
        dialog.run();
        break;
      case "safeOpened":
        dialog.changeText("Let's see what is in the safe...", "");
        dialog.run();
        break;
      case "letter":
        dialog.changeText("a map with a big X", "this must lead to the missing people?");
        dialog.run();
    }

    if (timer > 30) {
      if (keyPressed || mousePressed) {
        itemPressed = "";
      }
    }
  }
}
