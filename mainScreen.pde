
class mainScreen {
    PImage titleScreen, tutorial;
    int screen = 1;
    int timer = 0;

    gameObject hitBox = new gameObject(width/2 - 600, height/2 + 200, 1200, 200, "slot.png", false);
    gameObject arrowGate = new gameObject(width-280, height/2+300, 150, 120, "arrowRight.png", false);
    gameObject arrowText1 = new gameObject(width-280, height/2+300, 150, 120, "arrowRight.png", false);
    gameObject arrowText2 = new gameObject(width-200, height/2+280, 100, 80, "arrowRight.png", false);
    dialog dialog = new dialog();

    mainScreen() {
        titleScreen = loadImage("titleScreen.png");
        tutorial = loadImage("wasteland.png");
        hitBox.setup();
        arrowGate.setup();
        arrowText1.setup();
        arrowText2.setup();
    }

    void run() {
        switch(screen) {
            case 1:
                image(titleScreen, 0, 0);
                break;
            case 2:
                image(tutorial, 0, 0);
                dialog.changeText("Tip:", "press 'tab' to show the inventory");
                dialog.run();
                arrowGate.draw();
                break;
            case 3:
                image(tutorial, 0, 0);
                dialog.changeText("Old town road was a town in the wild west, where", 
                "bandits ravaged cities. Three months ago it became");
                dialog.run();
                arrowText1.draw();
                break;
            case 4:
                image(tutorial, 0, 0);
                dialog.changeText("a ghost town. Everyone assumed they all died, but the",
                "sheriff didn't believe it, so he went to solve the mystery...");
                dialog.run();
                arrowText2.draw();
                break;
        }

        if (keyPressed || mousePressed) {
            if (timer > 30) {
                if(screen == 1 && hitBox.clicked()) {
                    screen = 3;
                    timer = 0;
                } else if (screen == 3) {
                    screen = 4;
                    timer = 0;
                } else if (screen == 4) {
                    screen = 2;
                    timer = 0;
                }
            }
        }

        if (timer < 40) {
            timer++;
        }
    }


}