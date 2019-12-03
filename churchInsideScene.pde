class churchInsideScene {
  PImage backGround;
  int timer= 0;
  String itemPressed = "";
  
  gameObject arrowOutside = new gameObject(width/2-50, height-150, 120, 150, "arrowDown.png", false);
  gameObject bible = new gameObject(width/2, 600, 300 , 170, "bible.png", false);
  dialog dialog = new dialog();

  churchInsideScene() {
    backGround = loadImage("churchInsideScene.png");
    arrowOutside.setup();
    bible.setup();
  }
  
  void run() {
    display();
    arrowOutside.draw();
    bible.draw();

    if(bible.clicked()) {
      itemPressed = "bible";
      timer = 0;
    }

    switch (itemPressed) {
      case "bible":
        dialog.changeText("I don’t think it matters but I hope to God those people are safe.", "");
        dialog.run();
        break;
      case "stool":
        dialog.changeText("I could use this to climb over objects...", "");
        dialog.run();
        break;
    }

    if (timer < 35) {
      timer++;
    }

    if (timer > 30) {
      if (keyPressed || mousePressed) {
        itemPressed = "";
      }
    }
  }
  
  void display() {
    image(backGround, 0, 0, width, height);
  }
  
}