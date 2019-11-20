Click click1 = new Click(100, 200, 100, 100, "Name");
SceneSwitch sceneswitch;

PImage arrow;

void setup() {
    fullScreen(FX2D);
    background(255);
    
    arrow = loadImage("arrowDown.png");
    sceneswitch = new SceneSwitch();
}

void draw() {
    click1.draw();

    image(arrow, 0, 0);

    sceneswitch.run();
}
