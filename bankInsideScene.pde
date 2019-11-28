
class bankInsideScene {
  PImage backGround1;
  PImage backGround2;
  boolean isSafeOpen = false;
  boolean dialogActive = false;
  boolean allPapers = false;
  String itemPressed = "";

  gameObject arrowOutside = new gameObject(width-150, 500, 150, 120, "arrowRight.png", false);
  dialog dialog = new dialog();

  bankInsideScene() {
    backGround1 = loadImage("bankInsideScene.png");
    backGround2 = loadImage("bankInsideSceneOpen.png");
    arrowOutside.setup();
  }

  void run() {
    dialogue();
    if (isSafeOpen) {
      image(backGround2, 0, 0);
    } else {
      image(backGround1, 0, 0);
    }
    //circle(300, height/2, 400);

    arrowOutside.draw();

    if (dist(mouseX, mouseY, 300, height/2) < 400 && mousePressed) {
      isSafeOpen = true;
    }
  }
  
  void dialogue() {
    switch(itemPressed) {
      case "paper":
        dialog.changeText("Another piece of paper...", "are these maybe for the safe?");
        dialog.run();
        dialogActive = true;
        break;
      case "saveLocked":
        dialog.changeText("hmmm...., I need a code to open this.", "Maybe I can find it somewhere in town.");
        dialog.run();
        dialogActive = true;
        break;
      case "saveOpened":
        dialog.changeText("Let's see what is in the safe...", "");
        dialog.run();
        dialogActive = true;
        break;
      case "letter":
        dialog.changeText("it says: 'we are in gods hands now'", "Maybe there is something in the church.");
        dialog.run();
        dialogActive = true;
      default:
        dialogActive = false;
        break;
    }
  }
}
