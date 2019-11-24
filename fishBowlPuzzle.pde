
class fishBowlPuzzle {
  int pieceHolding;

  PImage background;
  PImage leftTop, leftBottom, rightBottom, rightTop;

  boolean isActive = false;

  PuzzlePiece[] Pieces = new PuzzlePiece[4];
  
  boolean[] placeEmpty = new boolean[4];

  gameObject arrowBack = new gameObject(100, 100, 100, 100, "arrowDown.png", false);


  fishBowlPuzzle() {
    background = loadImage("woodenFloor.jpg");
    //leftTop = loadImage("fishBowlLeftTop.png");
    //leftBottom = loadImage("fishBowlLeftBottom.png");
    //rightBottom = loadImage("fishBowlRightBottom.png");
    //rightTop = loadImage("fishBowlRightTop.png");
    arrowBack.setup();


    Pieces[0] = new PuzzlePiece(width/6, height/5, 1, 300, 300, "fishBowlLeftTop.png", false);
    Pieces[1] = new PuzzlePiece(width/6*4, height/5, 3, 300, 300, "fishBowlLeftBottom.png", false);
    Pieces[2] = new PuzzlePiece(width/6, height/5*3, 4, 300, 300, "fishBowlRightBottom.png", false);
    Pieces[3] = new PuzzlePiece(width/6*4, height/5*3, 2, 300, 300, "fishBowlRightTop.png", false);

    for (int i = 0; i < Pieces.length; i++) {
      Pieces[i].setup();
      placeEmpty[i] = true;
    }
  }

  void run() {
    display();
    blockOtherPieces();
    arrowBack.draw();
  }

  void display() {
    image(background, 0, 0, width, height);

    rect(width/2, height/2, -Pieces[0].sizeX/3*2, -Pieces[0].sizeX/3*2);
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
}

//---------------------------------------------------------------PuzzlePiece class

class PuzzlePiece extends gameObject {
  int startX, startY;
  int dropBox;
  PVector P1, P2, P3, P4;

  boolean pickedUp, justPicked;
  boolean grabBlock = false;
  boolean placed = false;

  PuzzlePiece(int posX, int posY, int dropBox, int sizeX, int sizeY, String file, boolean state) {
    super(posX, posY, sizeX, sizeY, file, state);
    this.dropBox = dropBox;
    startX = posX;
    startY = posY;
    P1 = new PVector(width/2-sizeX, height/2-sizeY);
    P2 = new PVector(width/2, height/2-sizeY);
    P3 = new PVector(width/2-sizeX, height/2);
    P4 = new PVector(width/2, height/2);
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
    } else {
      pickedUp = false;
    }
  }

  void snapping() {
    if (clicked() && inRange(P1)) {
      posX = (int)P1.x;
      posY = (int)P1.y;
      placed = true;
    } else if (clicked() && inRange(P2)) {
      posX = (int)P2.x;
      posY = (int)P2.y;
      placed = true;
    } else if (clicked() && inRange(P3)) {
      posX = (int)P3.x;
      posY = (int)P3.y;
      placed = true;
    } else if (clicked() && inRange(P4)) {
      posX = (int)P4.x;
      posY = (int)P4.y;
      placed = true;
    } else if (clicked() == false && inRange(P1) == false && inRange(P2) == false &&
      inRange(P3) == false && inRange(P4) == false && placed == false) {
      posX = startX;
      posY = startY;
    }
    
    if(clicked() && justPicked == false) {
      placed = false;
      justPicked = true;
    } else if (clicked() == false) {
      justPicked = false;
    }
  }

  boolean inRange(PVector pos) {
    if (dist(mouseX, mouseY, pos.x + sizeX/2, pos.y + sizeY/2) < (sizeX + sizeY)/4) {
      return true;
    }
    return false;
  }
}
