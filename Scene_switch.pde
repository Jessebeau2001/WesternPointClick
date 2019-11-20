
class SceneSwitch {

  String StreetScene = "StreetScene";
  String BarScene = "BarScene";
  String SaloonScene = "SaloonScene";

  String currentScene = StreetScene;
  String previousScene = "";

  void run() {
    if (currentScene == StreetScene) {
      StreetScene();
    } else if (currentScene == BarScene) {
      BarScene();
    } else if (currentScene == SaloonScene) {
      SaloonScene();
    }
  }

  void StreetScene() {
    fill(200);
    textSize(128);
    text("Street Scene", width/2, height/2);
  }
  
  void BarScene() {
    fill(200);
    textSize(128);
    text("Bar Scene", width/2, height/2);
  }
  
  void SaloonScene() {
    fill(200);
    textSize(128);
    text("Saloon Scene", width/2, height/2);
  }

}
