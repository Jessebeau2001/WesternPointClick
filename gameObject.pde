class gameObject{
    public int posX, posY;
    int boundX, boundY;
    int sizeX, sizeY;
    String imageFile;
    boolean clickState = true;
    boolean isPickup;
    boolean isInToolbar = false;

    PImage image;

    gameObject(int posX, int posY, int sizeX, int sizeY, String imageFile, boolean isPickup) {
        this.posX = posX;
        this.posY = posY;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.imageFile = imageFile;
        this.isPickup = isPickup;
    }

    void setup() {
        image = loadImage(imageFile);
        //boundX = image.width;
        //boundY = image.height;
        boundX = sizeX;
        boundY = sizeY;
    }
    
    void draw() {
        image(image, posX, posY, sizeX, sizeY);
    }

    boolean clicked() {
        if (mousePressed) {
            if(mouseX > posX && mouseX < posX + boundX) {
                if(mouseY > posY && mouseY < posY + boundY) {
                    return true;
                }
            }
        }
    return false;
    }

    public void pickup(int posX) {
            isPickup = false;
            this.posX = posX - sizeX/2;
            posY = (height-120 - sizeY/2);
    }
    
    void holding() {
      posX = mouseX - sizeX/2;
      posY = mouseY - sizeY/2;
    }
}
