//gameObject wantedPoster = new gameObject(400, 600, 0, 0, "wantedPoster.png");
//inventory toolbar = new inventory();

SceneSwitch sceneSwitch;

void setup() {
    fullScreen(FX2D);
    //size(800, 800, FX2D);
    background(255);
    sceneSwitch = new SceneSwitch("streetScene");
    //toolbar.setup();
    //wantedPoster.setup();
}

void draw() {
    background(255);

    sceneSwitch.run();

    //toolbar.draw();

    //wantedPoster.draw();
}
