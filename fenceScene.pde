class fenceScene {
    PImage background;
    String itemPressed = "firstTime";
    int timer = 0;
    boolean stoolPlaced = false;
    boolean canContinue = false;

    gameObject arrowBank = new gameObject(70, 440, 150, 120, "arrowLeft.png", false);
    gameObject arrowNext = new gameObject(width-150, 500, 150, 120, "arrowRight.png", false);
    
    dialog dialog = new dialog();

    fenceScene() {
        background = loadImage("fenceScene.png");
        arrowBank.setup();
        arrowNext.setup();
    }

    void draw() {
        image(background, 0, 0);
        arrowBank.draw();
          if (canContinue) {
            arrowNext.draw();
        }

        switch(itemPressed) {
            case "firstTime":
                dialog.changeText("Looks like this is the end of the road,", "maybe I could use something to get over the fence.");
                dialog.run();
                break;
            default:
        }
        timer();
    }

    void timer() {
        timer++;
        if (timer > 60) {
            if (keyPressed || mousePressed) {
                itemPressed = "";
            }
        }
    }
}