class gameObject{
    int boundX, boundY;
    int sizeX, sizeY;
    String imageFile;
    boolean clickState = true;

    PImage image;

    gameObject(int boundX, int boundY,int sizeX, int sizeY, String imageFile) {
        this.boundX = boundX;
        this.boundY = boundY;
        //this.sizeX = sizeX;
        //this.sizeY = sizeY;
        this.imageFile = imageFile;
    }

    void setup() {
        image = loadImage(imageFile);
        sizeX = image.width;
        sizeY = image.height;
    }
    
    void draw() {
        image(image, boundX, boundY);
        //println("boundX: "+boundX, "boundY: "+boundY, "sizeX: "+sizeX, "sizeY: "+sizeY);
    }

    boolean clicked() {
        if (mousePressed) {
            if(mouseX > boundX && mouseX < boundX + sizeX) {
                if(mouseY > boundY && mouseY < boundY + sizeY) {
                    return true;
                }
            }
        }
    return false;
    }
}