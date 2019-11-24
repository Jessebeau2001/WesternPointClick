class gameObject{
    public int posX, posY;
    int boundX, boundY;
    int sizeX, sizeY;
    String imageFile;
    boolean clickState = true;
    boolean isPickup;

    PImage image;

    gameObject(int posX, int posY, int sizeX, int sizeY, String imageFile, boolean isPickup) {
        this.posX = posX;
        this.posY = posY;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.imageFile = imageFile;
        this.isPickup = isPickup;
        //this.isPickup = true;
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
                    //if (isPickup) {
                    //    return true;
                    //}
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
    
    void holding() {
      posX = mouseX - image.width/4;
      posY = mouseY - image.height/4;
    }
}
