
class gateScene {
  PImage background;
  boolean firstTime = true;
  boolean dialogActive;
  boolean hammerPicked = false;
  String itemPressed = "firstTime";
  int timer = 0;

  gameObject arrowStreet = new gameObject(width/2-60, 750, 120, 150, "arrowUp.png", false);
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
      dialogActive = true;
      break;
    case "hammer":
      dialog.changeText("Hmmm... , maybe I can use this to build something", "");
      dialog.run();
      dialogActive = true;
      break;
    default:
    }

    if (timer > 30) {
     if (keyPressed || mousePressed) {
       firstTime = false;
       itemPressed = "";
       dialogActive = false;
      }
    }

    if (timer < 35) {
      timer++;
    }
  }

  void display() {
    image(background, 0, 0, width+50, height+50);
  }
}
