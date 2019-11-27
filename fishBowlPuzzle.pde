
class fishBowlPuzzle {
  int pieceHolding;
  int[] Pos = new int[4];

  PImage background;
  PImage leftTop, leftBottom, rightBottom, rightTop;

  boolean isActive = false;
  boolean solved;
  boolean paperFree = false;

  PuzzlePiece[] Pieces = new PuzzlePiece[4];

  gameObject arrowBack = new gameObject(100, 100, 100, 100, "arrowDown.png", false);
  dialog dialog = new dialog();

  fishBowlPuzzle() {
    background = loadImage("fishBowlbackground.png");
    arrowBack.setup();


    Pieces[0] = new PuzzlePiece(width/10, height/5, 0, 471, 430, "fishBowlLeftTop.png", false);
    Pieces[1] = new PuzzlePiece(width/7*5, height/5, 2, 424, 522, "fishBowlLeftBottom.png", false);
    Pieces[2] = new PuzzlePiece(width/10, height/5*3, 3, 477, 564, "fishBowlRightBottom.png", false);
    Pieces[3] = new PuzzlePiece(width/7*5, height/5*3, 1, 490, 482, "fishBowlRightTop.png", false);

    for (int i = 0; i < Pieces.length; i++) {
      Pieces[i].setup();
      Pos[i] = -1;
    }
  }

  void run() {
    display();
    blockOtherPieces();
    blockSnapping();
    arrowBack.draw();
    
    if(solved()) {
      dialog.changeText("Why does it say 'bottles'... ", "maybe there is something behind the bottles on the shelf?");
      dialog.run();
    }
  }

  void display() {
    image(background, 0, 0, width, height);

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

//---------------------------------------------------------------PuzzlePiece class

class PuzzlePiece extends gameObject {
  int startX, startY;
  int currentP, finalP;
  PVector[] P = new PVector[4];
  boolean[] PEmpty = new boolean[4];

  boolean pickedUp, justPicked;
  boolean grabBlock = false;
  boolean placed = false;

  PuzzlePiece(int posX, int posY, int finalP, int sizeX, int sizeY, String file, boolean state) {
    super(posX, posY, sizeX, sizeY, file, state);
    this.finalP = finalP;
    startX = posX;
    startY = posY;
    P[0] = new PVector(550, 150);
    P[1] = new PVector(845, 150);
    P[2] = new PVector(534, 509);
    P[3] = new PVector(876, 467);
    for (int i = 0; i < PEmpty.length; i++) {
      PEmpty[i] = true;
    }
  }

  void run() {
    draw();
    moving();
    snapping();
  }

  void moving() {
    if (clicked() && grabBlock == false) {
      holding();
      pickedUp = true;
      placed = false;
    } else {
      pickedUp = false;
    }
  }

  void snapping() {
    for (int i = 0; i < P.length; i++) {
      if (clicked() && inRange(P[i]) && PEmpty[i]) {
        posX = (int)P[i].x;
        posY = (int)P[i].y;
        placed = true;
      } else if (clicked() == false && inRange(P[0]) == false && inRange(P[1]) == false &&
        inRange(P[2]) == false && inRange(P[3]) == false && placed == false) {
        posX = startX;
        posY = startY;
        currentP = -1;
      }
    }
  }

  boolean inRange(PVector pos) {
    if (dist(mouseX, mouseY, pos.x + sizeX/2, pos.y + sizeY/2) < (sizeX + sizeY)/8) {
      return true;
    }
    return false;
  }
}
