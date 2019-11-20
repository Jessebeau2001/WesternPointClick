
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
      if(streetScene.arrowGate.clicked()) {
        currentScene = GateScene;
      } else if(streetScene.arrowBar.clicked()) {
        currentScene = BarScene;
      }
    } else if (currentScene == BarScene) {
      barScene.run();
      if(barScene.arrowStreet.clicked()) {
        currentScene = StreetScene;
      }
    } else if (currentScene == GateScene) {
      gateScene.run();
      if(gateScene.arrowStreet.clicked()) {
        currentScene = StreetScene;
      }
    }
  }
}
