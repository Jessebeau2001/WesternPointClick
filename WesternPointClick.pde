gameObject wantedPoster = new gameObject(400, 600, 100, 100, "wantedPoster.png", true); //bug might be caused cuz its not in void setup
gameObject wantedPoster2 = new gameObject(100, 100, 100, 100, "wantedPoster.png", true); //minim library for better sound loading
inventory toolbar = new inventory();

int test;

SceneSwitch sceneSwitch;

void setup() {
    fullScreen(FX2D);
    //size(800, 800, FX2D);
    background(255);

    sceneSwitch = new SceneSwitch("gateScene");
    toolbar.setup();
    wantedPoster.setup();
    wantedPoster2.setup();
}

void draw() {
    background(255);

    sceneSwitch.run();

    toolbar.draw();

    wantedPoster.draw();
    wantedPoster.clicked();
    wantedPoster2.draw();
    wantedPoster2.clicked();
}

void mousePressed() {
    if (wantedPoster.clicked() && wantedPoster.isPickup) {
        wantedPoster.pickup(toolbar.getFreeSlot());
    };

    if (wantedPoster2.clicked() && wantedPoster2.isPickup) {
        wantedPoster2.pickup(toolbar.getFreeSlot());
    };
}
