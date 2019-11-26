
class barScene {  
  PImage background;
  
  gameObject arrowStreet = new gameObject(width - 200, 600, 100, 100, "arrowDown.png", false);
  gameObject arrowPuzzle = new gameObject(300, 600, 100, 100, "arrowDown.png", false);
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
  }
  
  void display() {
    image(background, 0, 0, width, height);
  }  
}
