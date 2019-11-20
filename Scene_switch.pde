
class SceneSwitch {

  String StreetScene = "StreetScene";
  String BarScene = "BarScene";
  String GateScene = "GateScene";
  
  PImage Street, Bar, Gate;

  String currentScene = GateScene;
  String previousScene = "";
  
  SceneSwitch() {
    Street = loadImage("StreetScene.png");
    Bar = loadImage("BarScene.png");
    Gate = loadImage("FrontGate.png");
  }

  void run() {
    if (currentScene == StreetScene) {
      StreetScene();
    } else if (currentScene == BarScene) {
      BarScene();
    } else if (currentScene == GateScene) {
      GateScene();
    }
  }

  void StreetScene() {
    image(Street, 0, 0);
    fill(200);
    textSize(128);
    text("Street Scene", width/2, height/2);
  }
  
  void BarScene() {
    image(Bar, 0 , 0, width, height);
    fill(200);
    textSize(128);
    text("Bar Scene", width/2, height/2);
  }
  
  void GateScene() {
    image(Gate, 0, 0, width, height);
    fill(200);
    textSize(128);
    text("Gate Scene", width/2, height/2);
  }

}
