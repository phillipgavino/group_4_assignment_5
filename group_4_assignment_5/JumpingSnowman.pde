class CircleSnowman extends Snowman{
    
  //the height that the snowman will jump
  float jumpHeight;
  
  float lerpFactor;
  
  //not set by parameters
  float fallIncrement;
  float startHeight; 
  boolean ascending;
  float currRotation;
  boolean posRot;
  
  CircleSnowman(float x, float y, float z, float r1, float r2, float r3, float jump, float lerp, float rotation) {
    super(x, y, z, r1, r2, r3, rotation, color(255));
    
    jumpHeight = jump;
    startHeight = rootY;
    lerpFactor = lerp;
    rotateAmount = rotation;
    
    fallIncrement = 1;
    
    ascending = false;
    
    currRotation = 0;
    posRot = true;
  }
  
  
  
  void move() {
    //BODY
    //check whether should be ascending or descending
    if (ascending){
      if (rootY <= jumpHeight + 1) {
        ascending = false;
      }
    }
    
    else {
      if (rootY >= startHeight - 1) {
        rootY = startHeight;
        fallIncrement = 1;
        ascending = true;
      }
    }
    
    //move
    if (ascending) {
      ascend();
    }
    
    else {
      descend();
    }
    
    //ARMS

    
    if (posRot) {
      if (currRotation >= rotateAmount) {
        posRot = false;
      }
    }
    else {
      if (currRotation <= -rotateAmount) {
        posRot = true;
      }
    }
    
    if (posRot) {
      currRotation += 0.02;
    }
    else {
      currRotation -= 0.02;
    }
    //draw arms
    pushMatrix();
    fill(142,109,57);
    
    translate(rootX, rootY - ((rad1 * 2) + rad2 - offset), rootZ);
    rotate(currRotation);
    box(150,10,20);
    
    popMatrix();
  }
  
  void ascend() {
    float newY = lerp(rootY, jumpHeight, lerpFactor);
    
    rootY = newY;
  }
  
  //TODO: Make this nonlinear
  void descend() {
    rootY += fallIncrement;
    
    fallIncrement *= (1 + lerpFactor);
  }
}
