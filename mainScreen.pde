
class mainScreen {
    PImage titleScreen, tutorial;
    boolean start = true;

    gameObject hitBox = new gameObject(width/2 - 600, height/2 + 200, 1200, 200, "slot.png", false);
    gameObject arrow = new gameObject(width-280, height/2+300, 150, 120, "arrowRight.png", false);
    dialog dialog = new dialog();

    mainScreen() {
        titleScreen = loadImage("titleScreen.png");
        tutorial = loadImage("wasteland.png");
        hitBox.setup();
        arrow.setup();
    }

    void run() {
        if (start) {
            image(titleScreen, 0, 0);
        } else {
            image(tutorial, 0, 0);
            dialog.changeText("Tip:", "press 'tab' to show the inventory");
            dialog.run();
            arrow.draw();
        }

        if(hitBox.clicked()) {
            start = false;
        }
    }


}