class inventory{
    PImage toolbar;

    boolean holding; 

    int toolbarImageHeight = 282;

    inventory() {

    }

    void setup() {
        toolbar = loadImage("toolbar.png");
    }

    void draw() {
        image(toolbar, 0, height - toolbar.height);
    }
}