
class SceneSwitch {

  String StreetScene = "streetScene";
  String BarScene = "barScene";
  String GateScene = "gateScene";
  String FishBowlPuzzle = "fishBowlPuzzle";
  String ChurchScene = "churchScene";
  String BankScene = "bankScene";
  String FenceScene = "fenceScene";
  String ChurchInsideScene = "churchInsideScene";

  String currentScene;

  gameObject wantedPoster = new gameObject(400, 600, 100, 100, "wantedPoster.png", true); //bug might be caused cuz its not in void setup
  gameObject wantedPoster2 = new gameObject(100, 100, 100, 100, "wantedPoster.png", true); //minim library for better sound loading
  inventory toolbar = new inventory();
  gameObject paper1 = new gameObject(width/2 - 100, 300, 500, 100, "slot.png", true );
  gameObject paper2 = new gameObject(800, 720, 50, 60, "slot.png", true);
  gameObject paper3 = new gameObject(1500, height/2, 150, 160, "slot.png", true);

  streetScene streetScene = new streetScene();
  barScene barScene = new barScene();
  gateScene gateScene = new gateScene();
  fishBowlPuzzle fishBowlPuzzle = new fishBowlPuzzle();
  churchScene churchScene = new churchScene();
  churchInsideScene churchInsideScene = new churchInsideScene();

  SceneSwitch(String startScene) {
    currentScene = startScene;
    wantedPoster.setup();
    wantedPoster2.setup();
    toolbar.setup();
    paper1.setup();
    paper2.setup();
  }

  void run() {    
    if (currentScene == StreetScene) { //currentScene = StreetScene;
      streetScene.run();
      streetScene();
    } 
    if (currentScene == BarScene) {
      barScene.run();
      barScene();
      if (paper1.clicked()) {
      }
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
    if (currentScene == ChurchInsideScene) {
      churchInsideScene.run();
      churchInsideScene();
    }

    //switch(currentScene) {
    //  case "StreetScene":
    //    println("Dikkel");
    //    break;
    //  case "BarScene":
    //    println("Buikel");
    //    break;  
    //}
    
    if (paper1.isInToolbar) {
      paper1.draw();
    }
    if (paper2.isInToolbar) {
      paper2.draw();
    }
    if (paper3.isInToolbar) {
      paper3.draw();
    }
    
    //wantedPoster.draw();
    //wantedPoster2.draw();
  }

  void streetScene() {
    toolbar.draw();
    paper2.draw();
    
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
    
    if (paper2.clicked() && paper2.isPickup ) {
      paper2.isInToolbar = true;
      paper2.pickup(toolbar.getFreeSlot());
    }
  }

  void gateScene() {
    toolbar.draw();
    
    if (gateScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
  }

  void barScene() {
    toolbar.draw();
    
    if (barScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (barScene.arrowPuzzle.clicked()) {
      currentScene = FishBowlPuzzle;
    }
    
    paper1.draw();
    
    if (paper1.clicked() && paper1.isPickup ) {
      paper1.sizeX = 100;
      paper1.sizeY = 100;
      paper1.isInToolbar = true;
      paper1.pickup(toolbar.getFreeSlot());
    }
    if (paper1.isInToolbar ) {
      paper1.draw();
    }
  }

  void churchScene() {
    toolbar.draw();
    
    if (churchScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (churchScene.arrowInside.clicked()) {
      currentScene = ChurchInsideScene;
    }
  }

  void churchInsideScene() {
    toolbar.draw();
    
    if (churchInsideScene.arrowOutside.clicked()) {
      currentScene = ChurchScene;
    }
  }

  void fishBowlPuzzle() {
    toolbar.draw();
    
    if (fishBowlPuzzle.arrowBack.clicked()) {
      currentScene = BarScene;
    }
  }

  //void mousePressed() {
  //  if (wantedPoster.clicked() && wantedPoster.isPickup) {
  //    wantedPoster.pickup(toolbar.getFreeSlot());
  //  }

  //  if (wantedPoster2.clicked() && wantedPoster2.isPickup) {
  //    wantedPoster2.pickup(toolbar.getFreeSlot());
  //  }
  //}
}
