class churchScene {
  PImage backGround;

  String itemName = "";
  int timer = 0;

  gameObject arrowStreet = new gameObject(width-150, height/2 + 200, 150, 120, "arrowRight.png", false);
  gameObject arrowInside = new gameObject(width/2-60, 800, 120, 150, "arrowUp.png", false);
  gameObject wantedFreddi = new gameObject(1550, 710, 60, 86, "WantedFreddi.png", false);
  gameObject hat = new gameObject(1111, 928, 150, 100, "slot.png", false);
  
  dialog dialog = new dialog();

  churchScene() {
    backGround = loadImage("churchScene.png");
    arrowStreet.setup();
    arrowInside.setup();
    wantedFreddi.setup();
    hat.setup();
  }
  
  void run() {
    display();
    arrowStreet.draw();
    arrowInside.draw();
    wantedFreddi.draw();
    
    if(hat.clicked()) {
      itemName = "hat";
      timer = 0;
    }

    switch (itemName) {
      case "Paper4":
        dialog.changeText("A wanted poster for ... a fish?!", "there is a piece of paper attached to it.");
        dialog.run();
        timer();
        break;
      case "hat":
        dialog.changeText("It’s so dusty, it is definitely been here for a while...", "and such a well-made hat.");
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
