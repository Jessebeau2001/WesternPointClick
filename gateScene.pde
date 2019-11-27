
class gateScene {
  PImage background;
  boolean firstTime = true;
  boolean dialogActive;
  boolean hammerPicked = false;
  String itemPressed = "firstTime";

  gameObject arrowStreet = new gameObject(width/2-50, 700, 100, 100, "arrowUp.png", false);
  dialog dialog = new dialog();

  gateScene() {
    background = loadImage("FrontGate.png");
    arrowStreet.setup();
  }

  void run() {
    display();
    arrowStreet.draw();

    switch(itemPressed) {
    case "firstTime":
      dialog.changeText("After all this time I am finally here. I've been waiting to", 
        "solve the mystery for a month now. Let's go to the city");
      dialog.run();
      break;
    case "hammer":
      dialog.changeText("Hmmm... , maybe I can use this to build something", "");
      dialog.run();
      break;
    default:
    }

    if (firstTime) {
      dialogActive = true;
    }

    if (keyPressed || mousePressed) {
      firstTime = false;
      itemPressed = "";
      dialogActive = false;
    }
  }

  void display() {
    image(background, 0, 0, width+50, height+50);
  }
}
