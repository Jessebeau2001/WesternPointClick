
class SceneSwitch {

  String StreetScene = "streetScene";
  String BarScene = "barScene";
  String GateScene = "gateScene";
  String FishBowlPuzzle = "fishBowlPuzzle";
  String ChurchScene = "churchScene";
  String BankScene = "bankScene";
  String FenceScene = "fenceScene";

  String currentScene;

  streetScene streetScene = new streetScene();
  barScene barScene = new barScene();
  gateScene gateScene = new gateScene();
  fishBowlPuzzle fishBowlPuzzle = new fishBowlPuzzle();
  churchScene churchScene = new churchScene();

  SceneSwitch(String startScene) {
    currentScene = startScene;
  }

  void run() {
    if (currentScene == StreetScene) { //currentScene = StreetScene;
      streetScene.run();
      streetScene();
    } 
    if (currentScene == BarScene) {
      barScene.run();
      barScene();
    }
    if (currentScene == GateScene) {
      gateScene.run();
      gateScene();
    }
    if (currentScene == FishBowlPuzzle) {
      fishBowlPuzzle.run();
      fishBowlPuzzle();
    }
    if (currentScene == ChurchScene) {
      churchScene.run();
      churchScene();
    }
    
    switch(currentScene) {
      case "StreetScene":
        println("Dikkel");
        break;
      case "BarScene":
        println("Buikel");
        break;  
    }
  }

  void streetScene() {
    if (streetScene.arrowGate.clicked()) {
      currentScene = GateScene;
    } 
    if (streetScene.arrowBar.clicked()) {
      currentScene = BarScene;
    }
    if (streetScene.arrowFence.clicked()) {
      currentScene = FenceScene;
    }
    if (streetScene.arrowChurch.clicked()) {
      currentScene = ChurchScene;
    }
  }

  void gateScene() {
    if (gateScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
  }

  void barScene() {
    if (barScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (barScene.arrowPuzzle.clicked()) {
      currentScene = FishBowlPuzzle;
    }
  }

  void churchScene() {
    if (churchScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
  }

  void fishBowlPuzzle() {
    if (fishBowlPuzzle.arrowBack.clicked()) {
      currentScene = BarScene;
    }
  }
}
