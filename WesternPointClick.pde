SceneSwitch sceneSwitch;

void setup() {
    fullScreen(FX2D);
    //size(1920, 1080, FX2D);
    background(255);

    sceneSwitch = new SceneSwitch("bankInsideScene");
}

void draw() {
    background(255);

    sceneSwitch.run();
}

void mousePressed() {
    println("x: "+mouseX+" y: "+mouseY);
}