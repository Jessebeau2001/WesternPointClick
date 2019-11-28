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
  String BankPuzzle = "bankPuzzle";

  String currentScene;

  gameObject wantedPoster = new gameObject(400, 600, 100, 100, "wantedPoster.png", true); //bug might be caused cuz its not in void setup, minim library for better sound loading

  inventory toolbar = new inventory();

  gameObject paper1 = new gameObject(width/2 - 100, 300, 500, 100, "Code1.png", true );
  gameObject paper2 = new gameObject(800, 700, 50, 60, "Code3.png", true);
  gameObject paper3 = new gameObject(1300, height/2-100, 150, 160, "Code2.png", true);
  gameObject paper4 = new gameObject(1550, 710, 60, 86, "Code4.png", true); //should have the same coords (slightly smaller) than wantedfreddi
  gameObject wantedFreddi = new gameObject(1550, 710, 60, 86, "WantedFreddi.png", false);
  gameObject stool = new gameObject(670, 760, 140, 140, "StepUp.png", true);
  gameObject map = new gameObject(400, 600, 512, 288, "Map.png", true);

  gameObject hammer = new gameObject(240, 725, 100, 100, "hammer.png", true);

  streetScene streetScene = new streetScene();
  barScene barScene = new barScene();
  gateScene gateScene = new gateScene();
  fishBowlPuzzle fishBowlPuzzle = new fishBowlPuzzle();
  churchScene churchScene = new churchScene();
  churchInsideScene churchInsideScene = new churchInsideScene();
  bankScene bankScene = new bankScene();
  bankInsideScene bankInsideScene = new bankInsideScene();
  bankPuzzle bankPuzzle = new bankPuzzle();
  fenceScene fenceScene = new fenceScene();

  SceneSwitch(String startScene) {
    currentScene = startScene;
    wantedPoster.setup();
    toolbar.setup();
    paper1.setup();
    paper2.setup();
    paper3.setup();
    paper4.setup();
    wantedFreddi.setup();
    hammer.setup();
    bankPuzzle.setup();
    stool.setup();
    map.draw();
  }

  void run() {    
    if (currentScene == StreetScene) {
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
      if(fishBowlPuzzle.arrowBack.clicked()) {
        currentScene = BarScene;
      }
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
    if (currentScene == BankPuzzle) {
      bankPuzzle.run();
      bankPuzzle();
    }
    if (currentScene == FenceScene) {
      fenceScene();
    }

    if (keyPressed) {
      if (key == TAB) {
        toolbar();
      }
    }

    //wantedPoster.draw();
    //if (wantedPoster.clicked() && wantedPoster.isPickup) {
    //  wantedPoster.pickup(toolbar.getFreeSlot());
    //  toolbar.fillSlot("Poster");
    //}
  }

  void streetScene() {
    if (!paper2.isInToolbar) {
      paper2.draw();
    }

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

    if (streetScene.brokenSign.clicked() && hammer.isInToolbar) {
      streetScene.signRepaired = true;
      hammer.isInToolbar = false;
      for (int i = 0; i < toolbar.slotFree.length; i++) {
        if (toolbar.items[i] == "Hammer") {
          toolbar.slotFree[i] = true;
        }
      }
    } else if (streetScene.brokenSign.clicked() && !streetScene.signRepaired) {
      streetScene.itemPressed = "noHammer";
    }

    if (paper2.clicked() && paper2.isPickup ) {
      paper2.isInToolbar = true;
      paper2.sizeX = 100;
      paper2.sizeY = 100;
      paper2.pickup(toolbar.getFreeSlot());
      toolbar.fillSlot("paper2");
      for (int i = 0; i < toolbar.slotFree.length; i++) {
        if (toolbar.items[i] == "paper") {
          streetScene.itemPressed = "paper2";
        } else {
          streetScene.itemPressed = "paper";
        }
      }
    }
  }

  void gateScene() {
    if (!gateScene.dialogActive) {
      if (hammer.clicked() && hammer.isPickup) {
        hammer.pickup(toolbar.getFreeSlot());
        toolbar.fillSlot("Hammer");
      }
    }

    if (gateScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }

    if (!streetScene.signRepaired && !hammer.isInToolbar && !gateScene.dialogActive) {
      hammer.draw();
    }
  }

  void barScene() {

    if (barScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (barScene.arrowPuzzle.clicked()) {
      currentScene = FishBowlPuzzle;
    }

    if (fishBowlPuzzle.solved()) {
      if (paper1.clicked() && paper1.isPickup ) {
        paper1.sizeX = 100;
        paper1.sizeY = 100;
        paper1.pickup(toolbar.getFreeSlot());
        toolbar.fillSlot("paper");
        barScene.itemPressed = "paper";
      }
    }
  }

  void churchScene() {
    wantedFreddi.draw();
    if (churchScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (churchScene.arrowInside.clicked()) {
      currentScene = ChurchInsideScene;
    }
    
    if(paper4.clicked() && !paper4.isInToolbar) {
      paper4.isInToolbar = true;
      paper4.pickup(toolbar.getFreeSlot());
      toolbar.fillSlot("paper4");
      churchScene.itemName = "Paper4";
    }
  }

  void churchInsideScene() {
    if (churchInsideScene.arrowOutside.clicked()) {currentScene = ChurchScene;}
    if (stool.clicked() && stool.isPickup) {
      stool.sizeX = 100;
      stool.sizeY = 100;
      stool.pickup(toolbar.getFreeSlot());
      toolbar.fillSlot("Stool");
    }
      if (!stool.isInToolbar) {stool.draw();}
  }

  void fishBowlPuzzle() {
    if (fishBowlPuzzle.arrowBack.clicked()) {
      currentScene = BarScene;
    }
  }

  void bankScene() {
    if (bankScene.arrowBank.clicked()) {
      currentScene = BankInsideScene;
    }
    if (bankScene.arrowStreet.clicked()) {
      currentScene = StreetScene;
    }
    if (bankScene.arrowFenceScene.clicked()) {
      currentScene = FenceScene;
    }
  }

  void bankInsideScene() {
    if (!paper3.isInToolbar) {paper3.draw();}
    //circle(350, 380, 650); //for reference of the hitbox of the giant vault
    if (bankInsideScene.arrowOutside.clicked()) {
      currentScene = BankScene;
    }

    if (dist(mouseX, mouseY, 350, 380) < 650 && mousePressed && !bankInsideScene.isSafeOpen && bankInsideScene.allPapers) {
      currentScene = BankPuzzle;
    }

    if (bankPuzzle.solved()) {
      map.draw();
      bankInsideScene.isSafeOpen = true;
      if (map.clicked() && map.isPickup) {
        map.pickup(toolbar.getFreeSlot());
        toolbar.fillSlot("map");
      }
    }
    
    if(paper1.isInToolbar && paper2.isInToolbar && paper3.isInToolbar && paper4.isInToolbar) {
      bankInsideScene.allPapers = true;
    } else {
      
    }

    if (paper3.clicked() && paper3.isPickup) {
      paper3.isInToolbar = true;
      paper3.sizeX = 100;
      paper3.sizeY = 100;
      paper3.pickup(toolbar.getFreeSlot());
      toolbar.fillSlot("paper3");
      bankInsideScene.itemPressed = "paper";
    }
  }

  void bankPuzzle() {
    if (bankPuzzle.arrowBack.clicked()) {
      currentScene = BankInsideScene;
    }

    if (bankPuzzle.solved()) {
      currentScene = BankInsideScene;
    }
  }

  void fenceScene() {
    fenceScene.draw();
    if (fenceScene.arrowBank.clicked()) {currentScene = BankScene;}

    if (stool.clicked() && stool.isInToolbar) {
      stool.posX = 575;
      stool.posY = 783;
      stool.sizeX = 200;
      stool.sizeY = 200;
      fenceScene.stoolPlaced = true;
      stool.isInToolbar = false;
    }
    if (fenceScene.stoolPlaced) {stool.draw();}
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
    if (paper4.isInToolbar) {
      paper4.draw();
    }
    if (stool.isInToolbar) {stool.draw();}
  }
}
