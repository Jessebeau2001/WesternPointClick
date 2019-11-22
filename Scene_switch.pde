
class SceneSwitch {

  String StreetScene = "streetScene";
  String BarScene = "barScene";
  String GateScene = "gateScene";
  String FishBowlPuzzle = "fishBowlPuzzle";

  String currentScene = "";
  
  streetScene streetScene = new streetScene();
  barScene barScene = new barScene();
  gateScene gateScene = new gateScene();
  fishBowlPuzzle fishBowlPuzzle = new fishBowlPuzzle();
  
  SceneSwitch(String startScene) {
    currentScene = startScene;
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
      } else if (barScene.arrowPuzzle.clicked()) {
        currentScene = FishBowlPuzzle;
      }
    } else if (currentScene == GateScene) {
      gateScene.run();
      if(gateScene.arrowStreet.clicked()) {
        currentScene = StreetScene;
      }
    } else if (currentScene == FishBowlPuzzle) {
      fishBowlPuzzle.run();
      if(fishBowlPuzzle.arrowBack.clicked()) {
        currentScene = BarScene;
      }
    }
  }
}
