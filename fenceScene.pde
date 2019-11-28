class fenceScene {
    PImage background;

    gameObject arrowBank = new gameObject(200, 200, 150, 120, "arrowLeft.png", false);
    
    fenceScene() {
        background = loadImage("fenceScene.png");
    }

    void draw() {
        image(background, 0, 0);
    }
}