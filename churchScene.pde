class churchScene {
  PImage backGround;

  String itemName = "";
  int timer = 0;

  gameObject arrowStreet = new gameObject(width-150, height/2 + 200, 150, 120, "arrowRight.png", false);
  gameObject arrowInside = new gameObject(width/2-60, 850, 120, 150, "arrowUp.png", false);
  gameObject wantedFreddi = new gameObject(1550, 710, 60, 86, "WantedFreddi.png", false);
  
  dialog dialog = new dialog();

  churchScene() {
    backGround = loadImage("churchScene.png");
    arrowStreet.setup();
    arrowInside.setup();
    wantedFreddi.setup();
  }
  
  void run() {
    display();
    arrowStreet.draw();
    arrowInside.draw();
    wantedFreddi.draw();

    switch (itemName) {
      case "Paper4":
        dialog.changeText("There was a piece of paper attatched to the wanted poster", "what could it mean?");
        dialog.run();
        timer();
        break;
    }
  }
  
  void display() {
    image(backGround, 0, 0, width, height);
  }

  void timer() {
    timer++;
    if (timer > 60) {
      if (keyPressed || mousePressed) {
        itemName = "";
      }
    }
  }
}
