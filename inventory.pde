class inventory{
    PImage toolbar;

    boolean holding; 
    int toolbarImageHeight = 282;
    int slotAmount = 5;
    int slotSpacing, slotSpacingEdge;

    inventory() {

    }

    void setup() {
        toolbar = loadImage("toolbar.png");
    }

    void draw() {
        image(toolbar, 0, height - toolbar.height);

        slotSpacing = width/slotAmount;
        slotSpacingEdge =  slotSpacing/2;

        ellipse(width/2, height/2, 100, 100);
    }
}