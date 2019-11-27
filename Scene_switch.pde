class SceneSwitch {
  String StreetScene = "streetScene";
  String BarScene = "barScene";
  String GateScene = "gateScene";
  String FishBowlPuzzle = "fishBowlPuzzle";
  String ChurchScene = "churchScene";
  String BankScene = "bankScene";
  String FenceScene = "fenceScene";
  String ChurchInsideScene = "churchInsideScene";
  String BankInsideScene = "bankInsideScene";

  String currentScene;

  gameObject wantedPoster = new gameObject(400, 600, 100, 100, "wantedPoster.png", true); //bug might be caused cuz its not in void setup, minim library for better sound loading

  inventory toolbar = new inventory();

  gameObject paper1 = new gameObject(width/2 - 100, 300, 500, 100, "slot.png", true );
  gameObject paper2 = new gameObject(800, 720, 50, 60, "slot.png", true);
  gameObject paper3 = new gameObject(1300, height/2-100, 150, 160, "slot.png", true);

  gameObject hammer = new gameObject(200, 200, 100, 100, "hammer.png", true);

  streetScene streetScene = new streetScene();
  barScene barScene = new barScene();
  gateScene gateScene = new gateScene();
  fishBowlPuzzle fishBowlPuzzle = new fishBowlPuzzle();
  churchScene churchScene = new churchScene();
  churchInsideScene churchInsideScene = new churchInsideScene();
  bankScene bankScene = new bankScene();
  bankInsideScene bankInsideScene = new bankInsideScene();

  SceneSwitch(String startScene) {
    currentScene = startScene;
    wantedPoster.setup();
    toolbar.setup();
    paper1.setup();
    paper2.setup();
    paper3.setup();
    hammer.setup();
  }

  void run() {    
    if (currentScene == StreetScene) {
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
    if (currentScene == BankScene) {
      bankScene.run();
      bankScene();
    }
    if (currentScene == BankInsideScene) {
      bankInsideScene.run();
      bankInsideScene();
    }

    //wantedPoster.draw();
    //if (wantedPoster.clicked() && wantedPoster.isPickup) {
    //  wantedPoster.pickup(toolbar.getFreeSlot());
    //  toolbar.fillSlot("Poster");
    //} 
  }

  void streetScene() {
    toolbar();
    paper2.draw();

    if (streetScene.arrowGate.clicked()) {
      currentScene = GateScene;
    } 
    if (streetScene.arrowBar.clicked()) {
      currentScene = BarScene;
    }

    if (streetScene.signRepaired) {
      if (streetScene.arrowBank.clicked()) {
        currentScene = BankScene;
      }
      if (streetScene.arrowChurch.clicked()) {
        currentScene = ChurchScene;
      }
    }

    if (hammer.clicked() && hammer.isInToolbar) {
      streetScene.signRepaired = true;
      hammer.isInToolbar = false;
      for (int i = 0; i < toolbar.slotFree.length; i++) {
        if (toolbar.items[i] == "Hammer") {
          toolbar.slotFree[i] = true;
        }
      }
    }

    if (paper2.clicked() && paper2.isPickup ) {
      paper2.isInToolbar = true;
      paper2.sizeX = 100;
      paper2.sizeY = 100;
      paper2.pickup(toolbar.getFreeSlot());
    }
  }

  void gateScene() {
    if (!gateScene.firstTime) {
      toolbar();
      if (hammer.clicked() && hammer.isPickup) {
        hammer.pickup(toolbar.getFreeSlot());
        toolbar.fillSlot("Hammer");
      }
    }

    if (gateScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    
    if (!streetScene.signRepaired) {
      hammer.draw();
    }
  }

  void barScene() {
    toolbar();

    if (barScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (barScene.arrowPuzzle.clicked()) {
      currentScene = FishBowlPuzzle;
    }

    if (paper1.clicked() && paper1.isPickup ) {
      paper1.sizeX = 100;
      paper1.sizeY = 100;
      paper1.pickup(toolbar.getFreeSlot());
    }
    if (paper1.isInToolbar ) {
      paper1.draw();
    }
  }

  void churchScene() {
    toolbar();

    if (churchScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (churchScene.arrowInside.clicked()) {
      currentScene = ChurchInsideScene;
    }
  }

  void churchInsideScene() {
    toolbar();

    if (churchInsideScene.arrowOutside.clicked()) {
      currentScene = ChurchScene;
    }
  }

  void fishBowlPuzzle() {
    toolbar();

    if (fishBowlPuzzle.arrowBack.clicked()) {
      currentScene = BarScene;
    }
  }

  void bankScene() {
    toolbar();

    if (bankScene.arrowBank.clicked()) {
      currentScene = BankInsideScene;
    }
    if (bankScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
  }

  void bankInsideScene() {
    toolbar();
    paper3.draw();

    if (bankInsideScene.arrowOutside.clicked()) {
      currentScene = BankScene;
    }

    if (paper3.clicked() && paper3.isPickup) {
      paper3.isInToolbar = true;
      paper3.sizeX = 100;
      paper3.sizeY = 100;
      paper3.pickup(toolbar.getFreeSlot());
    }
  }

  void toolbar() {
    toolbar.draw();
    if (hammer.isInToolbar) {
      hammer.draw();
    }
    if (paper1.isInToolbar) {
      paper1.draw();
    }
    if (paper2.isInToolbar) {
      paper2.draw();
    }
    if (paper3.isInToolbar) {
      paper3.draw();
    }
  }

  void mousePressed() {

  }
}