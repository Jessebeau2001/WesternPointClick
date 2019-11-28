

class endScene {
    PImage wasteland, canyon, end;

    int scene = 1;
    int timer = 0;

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
                dialog.changeText("iieeeh aaa", "");
                dialog.run();
            break;
            case 2:
                image(canyon, 0, 0);
                dialog.changeText("asergdijlo", "");
                dialog.run();
            break;
            case 3:
                image(end, 0, 0);
                dialog.changeText("esdrgfhjuk", "");
                dialog.run();
        }

        if (keyPressed || mousePressed) {
            if (timer > 30) {
                scene++;
                timer = 0;
            }
        }
        if (timer < 40) {
            timer++;
        }
    }
}
