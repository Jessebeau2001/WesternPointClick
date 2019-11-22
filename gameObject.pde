class gameObject{
    public int posX, posY;
    int boundX, boundY;
    int size;
    String imageFile;
    boolean clickState = true;
    boolean isPickup;

    PImage image;

    gameObject(int posX, int posY, int size, String imageFile, boolean isPickup) {
        this.posX = posX;
        this.posY = posY;
        this.size = size;
        this.imageFile = imageFile;
        this.isPickup = isPickup;
    }

    void setup() {
        image = loadImage(imageFile);
        boundX = image.width;
        boundY = image.height;
    }
    
    void draw() {
        image(image, posX, posY);
    }

    boolean clicked() {
        if (mousePressed) {
            if(mouseX > posX && mouseX < posX + boundX) {
                if(mouseY > posY && mouseY < posY + boundY) {
                    if (isPickup) {
                        //pickup();
                    }
                    return true;
                }
            }
        }
    return false;
    }

    public void pickup(int posX) {
        isPickup = false;
        this.posX = posX;
        posY = height-120;
    }
}