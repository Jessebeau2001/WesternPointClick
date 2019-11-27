class dialog {
  int currentDialog = 0;
  PFont font;
  PImage dialogBar;
  
  dialog() {
    font = createFont("dialogText.ttf", 40);
    dialogBar = loadImage("dialogBar.png");
  }
  
  void changeScene(int newDialog) {
    currentDialog = newDialog;
  }
  
  void run() {
    textFont(font);
    switch(currentDialog) {
      case 0:
        image(dialogBar, 0, 0);
        text("After all this time I am finally here. I've been", 150, height/5*4+20);
        text("waiting to solve the mystery for a month now", 150, height/5*4+75);
        break;
      case 1:
        println("second dialog");
        break;
    }
  }
  
  void gateDialog() {
    
  }
  
}
