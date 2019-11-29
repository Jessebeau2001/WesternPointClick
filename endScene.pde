

class endScene {
    PImage wasteland, canyon, end;

    int scene = 1;
    int timer = 0;
    boolean homeScreen = false;

    dialog dialog = new dialog();

    endScene() {
        wasteland = loadImage("wasteland.png");
        canyon = loadImage("canyon.png");
        end = loadImage("endSceneSunset.png");
    }

    void run() {
        switch (scene) {
            case 1:
                image(wasteland, 0, 0);
                dialog.changeText("through the wast land, to the marked X", "");
                dialog.run();
                break;
            case 2:
                image(canyon, 0, 0);
                dialog.changeText("this is the spot, right?", "hello, anybody there!?!");
                dialog.run();
                break;
            case 3:
                image(canyon, 0, 0);
                dialog.changeText("I think I see them...", "Yes! I have solved the mystery!");
                dialog.run();
                break;
            case 4:
                image(end, 0, 0);
                dialog.changeText("after having safed the whole town, he went back to his", "hometown. with a big smile.");
                dialog.run();
                break;
            case 5:
                image(end, 0, 0);
                dialog.changeText("THANK YOU FOR PLAYING COWBOY, WE COULD not HAVE done", "it without you!");
                dialog.run();
                break;
            case 6:
                homeScreen = true;
        }

        if (keyPressed || mousePressed) {
            if (timer > 30 && scene < 6) {
                scene++;
                timer = 0;
            }
        }
        if (timer < 40) {
            timer++;
        }
    }
}
