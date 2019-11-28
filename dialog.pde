class dialog {
  PFont font;
  PImage dialogBar;
  String rule1, rule2;

  dialog() {
    font = createFont("dialogText.ttf", 40);
    dialogBar = loadImage("dialogBar.png");
  }

  void changeText(String rule1, String rule2) {
    this.rule1 = rule1;
    this.rule2 = rule2;
  }

  void run() {
    textFont(font);
    image(dialogBar, 0, 0);
    text(rule1, 120, height/5*4+20);
    text(rule2, 120, height/5*4+75);
  }
}
