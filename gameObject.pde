class gameObject{
    int boundX, boundY;
    int sizeX, sizeY;
    String imageFile;

    PImage image;

    gameObject(int boundX, int boundY,int sizeX, int sizeY, String imageFile) {
        this.boundX = boundX;
        this.boundY = boundY;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.imageFile = imageFile;
    }

    void setup() {
        image = loadImage(imageFile);
    }
    
    void draw() {
        image(image, boundX, boundY);
        //println("boundX: "+boundX, "boundY: "+boundY, "sizeX: "+sizeX, "sizeY: "+sizeY);
    }

    boolean pressed() {
        if(mouseX > boundX && mouseX < boundX + sizeX) {
            if(mouseY > sizeY && mouseY < boundY + sizeY) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
