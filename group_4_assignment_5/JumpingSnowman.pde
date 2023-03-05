class JumpingSnowman {
  
  //the root position values that the snowman will be drawn from. represent the bottom of the snowman.
  float rootX;
  float rootY;
  float rootZ;
  
  //the radius sizes of each sphere making up the snowman
  float rad1;
  float rad2;
  float rad3;
  
  //the height that the snowman will jump
  float jumpHeight;
  
  float lerpFactor;
  float rotateAmount;
  
  //not set by parameters
  float fallIncrement;
  float startHeight; 
  boolean ascending;
  float sphereOffset;
  float currRotation;
  boolean posRot;
  
  JumpingSnowman(float x, float y, float z, float r1, float r2, float r3, float jump, float lerp, float rotation) {
    rootX = x;
    rootY = y;
    rootZ = z;
    
    rad1 = r1;
    rad2 = r2;
    rad3 = r3;
    
    jumpHeight = jump;
    startHeight = rootY;
    lerpFactor = lerp;
    rotateAmount = rotation;
    
    fallIncrement = 1;
    
    sphereOffset = 20;
    ascending = false;
    
    currRotation = 0;
    posRot = true;
  }
  
  void display(){
    fill(255);
    noStroke();
    
    //draw sphere 1
    pushMatrix();
      
      translate(rootX, rootY - (rad1), rootZ); //rootY subtracted by radius so that root will be bottom of sphere
      sphere(rad1);
      
    popMatrix();
    
    //draw sphere 2
    pushMatrix();
      
      translate(rootX, rootY - ((rad1 * 2) + rad2 - sphereOffset), rootZ);
      sphere(rad2);
    
    popMatrix();
    
    //draw sphere 3
    pushMatrix();
    
      translate(rootX, rootY - ((rad1 * 2) + (rad2 * 2) + rad3 - (sphereOffset * 1.4)), rootZ);
      sphere(rad3);
    
    popMatrix();
    
    //draw arms
    pushMatrix();
    fill(142,109,57);
    
    translate(rootX, rootY - ((rad1 * 2) + rad2 - sphereOffset), rootZ);
    rotate(currRotation);
    box(150,10,20);
    
    popMatrix();
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
  }
  
  
  void ascend() {
    float newY = lerp(rootY, jumpHeight, lerpFactor);
    
    rootY = newY;
  }
  
  //TODO: Make this nonlinear
  void descend() {
    println("descend");
    rootY += fallIncrement;
    
    fallIncrement *= (1 + lerpFactor);
  }
}
