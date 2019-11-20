
class SceneSwitch {

  String StreetScene = "streetScene";
  String BarScene = "barScene";
  String GateScene = "gateScene";

  String currentScene = "";
  String previousScene = "";
  
  streetScene streetScene;
  barScene barScene = new barScene();
  gateScene gateScene = new gateScene();
  
  SceneSwitch(String startScene) {
    currentScene = startScene;
    streetScene = new streetScene();
  }

  void run() {
    if (currentScene == StreetScene) {
      streetScene.run();
      if(streetScene.arrowGate.pressed()) {
        currentScene = GateScene;
      }
    } else if (currentScene == BarScene) {
      barScene.run();
    } else if (currentScene == GateScene) {
      gateScene.run();
    }
    streetScene.run();
  }
}
