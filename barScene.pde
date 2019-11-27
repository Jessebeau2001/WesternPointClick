
class barScene {  
  PImage background;
  
  gameObject arrowStreet = new gameObject(width - 200, height/2-200, 150, 120, "arrowRight.png", false);
  gameObject arrowPuzzle = new gameObject(300, 650, 80, 100, "arrowDown.png", false);
  fishBowlPuzzle puzzle;
  
  barScene() {
    background = loadImage("BarScene.png");
    arrowStreet.setup();
    arrowPuzzle.setup();
    puzzle = new fishBowlPuzzle();
  }
  
  void run() {
    display();
    arrowStreet.draw();
    arrowPuzzle.draw();
    
    if(puzzle.solved()) {
      text("done", 0, 100);
    }
  }
  
  void display() {
    image(background, 0, 0, width, height);
  }  
}
