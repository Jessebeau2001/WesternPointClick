class inventory{
    PImage toolbar;
    PImage slot;

    int slotSpacing, slotSpacingEdge;

    boolean[] slotFree = new boolean[8];
    int[] slots = new int[8];
    String[] items = new String[8];

    inventory() {

    }

    void setup() {
        toolbar = loadImage("toolbar.png");
        slot = loadImage("slot.png");

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
        image(toolbar, (width - toolbar.width)/2, height - toolbar.height - 45);
        for (int i = slotSpacingEdge; i < width; i = i + slotSpacing) {
            rectMode(CENTER);
            imageMode(CENTER);
            rect(i, height-120, 100, 100);
            image(slot, i, height-120);
            imageMode(CORNER);
            rectMode(CORNERS);
        }
        //for (int i = 0; i < slots.length; i++) {println(slots[i]);}
    }

    int getFreeSlot() {
        for (int i = 0; i < slotFree.length; i++) {
            if (slotFree[i]) {
                slotFree[i] = false;
                items[i] = "";
                //println(slots[i]);
                return slots[i];
            }
        }
        return 0;
    }
}