
class barScene {  
  PImage background;
  
  float imageX = -25;
  float imageY = -25;
  
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
    move();
    arrowStreet.draw();
    arrowPuzzle.draw();
  }
  
  void display() {
    image(background, imageX, imageY, width+50, height+50);
  }
  
  void move() {
    if(mouseX < width/5 && imageX < 0) {
      imageX += 1;
    }
    if(mouseX > width/5*4 && imageX > -50) {
      imageX -= 1;
    }
    if(mouseX > width/5 && mouseX < width/2 && imageX > -25) {
      imageX -= 0.5;
    }
    if(mouseX > width/2 && mouseX < width/5*4 && imageX < -25) {
      imageX += 0.5;
    }
    
    if(mouseY < height/5 && imageY < 0) {
      imageY += 1;
    }
    if(mouseY > height/5*4 && imageY > -50) {
      imageY -= 1;
    }
    if(mouseY > height/5 && mouseY < height/2 && imageY > -25) {
      imageY -= 0.5;
    }
    if(mouseY > height/2 && mouseY < height/5*4 && imageY < -25) {
      imageY += 0.5;
    }
  }
  
}
