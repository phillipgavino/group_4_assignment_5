class Snowman {
  
  //the root position values that the snowman will be drawn from. represent the bottom of the snowman.
  float rootX;
  float rootY;
  float rootZ;
  
  //the radius sizes of each sphere making up the snowman
  float rad1;
  float rad2;
  float rad3;
  
  float rotateAmount;
  
  float offset;
  
  color c;
  
  Snowman(float x, float y, float z, float r1, float r2, float r3, float rotation, color _c) {
    rootX = x;
    rootY = y;
    rootZ = z;
    
    rad1 = r1;
    rad2 = r2;
    rad3 = r3;
    
    rotateAmount = rotation;
    
    c = _c;
    
    offset = 0.5 * rad2;
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
      
      translate(rootX, rootY - ((rad1 * 2) + rad2 - offset), rootZ);
      sphere(rad2);
    
    popMatrix();
    
    //draw sphere 3
    pushMatrix();
    
      translate(rootX, rootY - ((rad1 * 2) + (rad2 * 2) + rad3 - (offset * 1.4)), rootZ);
      sphere(rad3);
    
    popMatrix();
  }
  

}
