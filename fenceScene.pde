class fenceScene {
    PImage background;

    gameObject arrowBank = new gameObject(70, 440, 150, 120, "arrowLeft.png", false);
    
    fenceScene() {
        background = loadImage("fenceScene.png");
        arrowBank.setup();
    }

    void draw() {
        image(background, 0, 0);
        arrowBank.draw();
    }
}