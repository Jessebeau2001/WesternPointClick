class bankPuzzle {
  int pieceHolding;
  int[] Pos = new int[4];
  PuzzlePiece[] Pieces = new PuzzlePiece[4];

  PImage background;

  boolean isActive = false;
  boolean solved;
  boolean paperFree = false;

  gameObject arrowBack = new gameObject(0, 50, 150, 120, "arrowLeft.png", false);


  bankPuzzle() {
    arrowBack.setup();
    background = loadImage("BankPuzzle.png");
    Pieces[0] = new PuzzlePiece(100, height/2+200, 1, 275, 410, "Code2.png", false);
    Pieces[1] = new PuzzlePiece(500, height/2+200, 3, 275, 410, "Code4.png", false);
    Pieces[2] = new PuzzlePiece(900, height/2+200, 0, 275, 410, "Code1.png", false);
    Pieces[3] = new PuzzlePiece(1300, height/2+200, 2, 275, 410, "Code3.png", false);

    for (int i = 0; i < Pieces.length; i++) {
      Pieces[i].setup();
    }
  }

  void setup() {
    for (int i = 0; i < Pieces.length; i++){
      Pieces[i].P[0].x = 300;
      Pieces[i].P[0].y = 200;
      Pieces[i].P[1].x = 498;
      Pieces[i].P[1].y = 198;
      Pieces[i].P[2].x = 692;
      Pieces[i].P[2].y = 201;
      Pieces[i].P[3].x = 886;
      Pieces[i].P[3].y = 195;
    }
  }

  void run() {
    display();
    blockOtherPieces();
    blockSnapping();

    if (solved()) {
      text("done", 100, 400);
    }
  }

  void display() {
    image(background, 0, 0);
    arrowBack.draw();

    for (int i = 0; i < Pieces.length; i++) {
      Pieces[i].run();
    }
  }

  void blockOtherPieces() {
    for (int i = 0; i < Pieces.length; i++) {
      if (Pieces[i].pickedUp && isActive == false) {
        pieceHolding = i;
        isActive = true;
        if (Pieces[i] != Pieces[0]) {
          Pieces[0].grabBlock = true;
        }
        if (Pieces[i] != Pieces[1]) {
          Pieces[1].grabBlock = true;
        }
        if (Pieces[i] != Pieces[2]) {
          Pieces[2].grabBlock = true;
        }
        if (Pieces[i] != Pieces[3]) {
          Pieces[3].grabBlock = true;
        }
      } else if (pieceHolding == i && Pieces[i].pickedUp == false) {
        pieceHolding = -1;
        isActive = false;
        for (int j = 0; j < Pieces.length; j++) {
          Pieces[j].grabBlock = false;
        }
      }
    }
  }

  void blockSnapping() {
    for (int i = 0; i < Pieces.length; i++) {
      if (Pieces[i].clicked() && Pieces[i].grabBlock == false) {
        for (int j = 0; j < Pos.length; j++) {
          if (Pieces[i].inRange(Pieces[i].P[j]) && Pos[j] == -1) {
            Pos[j] = i;
            Pieces[i].currentP = j;
            for (int l = 0; l < Pieces.length; l++) {
              if (i != l) {
                Pieces[l].PEmpty[j] = false;
              }
            }
          }
          if (Pieces[i].placed == false && Pos[j] == i) {
            Pos[j] = -1;
            for (int l = 0; l < Pieces.length; l++) {
              Pieces[l].PEmpty[j] = true;
            }
          }
        }
      }
    }
  }

  boolean solved() {
    if (Pieces[0].currentP == Pieces[0].finalP && Pieces[1].currentP == Pieces[1].finalP &&
      Pieces[2].currentP == Pieces[2].finalP && Pieces[3].currentP == Pieces[3].finalP) {
      return true;
    }    
    return false;
  }
}
