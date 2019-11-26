class inventory{
    PImage toolbar;

    boolean holding;
    int slotSpacing, slotSpacingEdge;

    boolean[] slotFree = new boolean[8];
    int[] slots = new int[8];
    inventory() {

    }

    void setup() {
        toolbar = loadImage("toolbar.png");

        slotSpacing = width / slotFree.length;
        slotSpacingEdge = slotSpacing / 2;

        for (int i = 0; i < slotFree.length; i++) {
            slotFree[i] = true;
        };

        for (int i = slotSpacingEdge; i < width; i = i + slotSpacing) {
            slots[(i-slotSpacingEdge)/slotSpacing] = i;
        }
    }

    void draw() {
        image(toolbar, 0, height - toolbar.height);
        for (int i = slotSpacingEdge; i < width; i = i + slotSpacing) {
            rectMode(CENTER);
            rect(i, height-120, 100, 100);
            rectMode(CORNERS);
        }
        //for (int i = 0; i < slots.length; i++) {println(slots[i]);}
    }

    int getFreeSlot() {
        for (int i = 0; i < slotFree.length; i++) {
            if (slotFree[i]) {
                slotFree[i] = false;
                //println(slots[i]);
                return slots[i];
            }
        }
        return 0;
    }
}