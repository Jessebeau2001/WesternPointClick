//gameObject wantedPoster = new gameObject(400, 600, 1, "wantedPoster.png", true);
//inventory toolbar = new inventory();

int test;

SceneSwitch sceneSwitch;

void setup() {
    fullScreen(FX2D);
    //size(800, 800, FX2D);
    background(255);

    sceneSwitch = new SceneSwitch("streetScene");
    toolbar.setup();
    wantedPoster.setup();
}

void draw() {
    background(255);

    sceneSwitch.run();

    //toolbar.draw();

    wantedPoster.draw();
    wantedPoster.clicked();
}

void mousePressed() {
    //test = inventory.getFreeSlot(); //AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARG

    //wantedPoster.pickup(inventory.getFreeSlot());
    //println(inventory.getFreeSlot());
}
