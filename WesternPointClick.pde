gameObject arrowDown = new gameObject(100, 100, 120, 150, "arrowDown.png");
gameObject wantedPoster = new gameObject(400, 600, 0, 0, "wantedPoster.png");
inventory toolbar = new inventory();

SceneSwitch sceneswitch;

void setup() {
    fullScreen(FX2D);
    //size(800, 800, FX2D);
    background(255);
    
    sceneswitch = new SceneSwitch();

    arrowDown.setup();
    toolbar.setup();
    wantedPoster.setup();
}

void draw() {
    background(255);

    sceneswitch.run();
    if (!arrowDown.clicked()) {
        arrowDown.draw();
    }

    toolbar.draw();

    wantedPoster.draw();
}
