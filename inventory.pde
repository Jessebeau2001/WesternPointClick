class inventory{
    PImage toolbar;

    boolean holding;
    int slotSpacing, slotSpacingEdge;

    boolean[] slotFree = new boolean[5];
    int[] slots = new int[5];

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
        for (int i = slotSpacingEdge; i < width; i = i + slotSpacing) {
            rectMode(CENTER);
            rect(i, height-120, 150, 150);
        }

        //for (int i = 0; i < slots.length; i++) {println(slots[i]);}
    }

    int getFreeSlot() {
        return 80;
//        for (int i = 0; i < slotFree.length; i++) {
//            if (slotFree[i] = false) {
//                slotFree[i] = true;
//                return slots[i];
//            }
//        }
//        return 0;
    }
}