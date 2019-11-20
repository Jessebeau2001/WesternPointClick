gameObject arrowDown = new gameObject(100, 100, 100, 100, "arrowDown.png");
SceneSwitch sceneswitch;

void setup() {
    //fullScreen(FX2D);
    size(800, 800, FX2D);
    background(255);
    
    sceneswitch = new SceneSwitch();

    arrowDown.setup();
}

void draw() {
    if (arrowDown.pressed()) {} else {
        arrowDown.draw();
    }

    sceneswitch.run();
}
