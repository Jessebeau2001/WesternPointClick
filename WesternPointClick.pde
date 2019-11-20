gameObject arrowDown = new gameObject(100, 100, 120, 150, "arrowDown.png");
SceneSwitch sceneSwitch;

void setup() {
    fullScreen(FX2D);
    //size(800, 800, FX2D);
    background(255);
    sceneSwitch = new SceneSwitch("streetScene");
    arrowDown.setup();
}

void draw() {
    background(255);
        
    arrowDown.draw();

    sceneSwitch.run();
    
}
