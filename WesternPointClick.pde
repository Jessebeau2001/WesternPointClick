SceneSwitch sceneswitch;

void setup() {
    fullScreen(FX2D);
    background(0);
    sceneswitch = new SceneSwitch();
}

void draw() {
  sceneswitch.run();
}
