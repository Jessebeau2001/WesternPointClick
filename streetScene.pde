
class streetScene {
  
  PImage background;
  String scene = "streetScene";
  String nextScene = null;
  
  float imageX = -25;
  float imageY = -25;
  
  gameObject arrowBar = new gameObject(500, 500, 100, "arrowDown.png", false);
  gameObject arrowGate = new gameObject(800, 900, 100, "arrowDown.png", false);
  
  streetScene() {
    background = loadImage("StreetScene.png");
    arrowBar.setup();
    arrowGate.setup();
  }
  
  void run() {
    display();
    move();
    //arrowBar.draw();
    arrowGate.draw();
    
    //imageX = map(mouseX, 0, width, 0, -50);
    //imageY = map(mouseY, 0, width, 0, -50);
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
