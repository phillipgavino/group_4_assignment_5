class BoxSnowman extends Snowman{
  
    BoxSnowman(float x, float y, float z, float r1, float r2, float r3, float jump, float lerp, float rotation) {
    super(x, y, z, r1, r2, r3, rotation, color(255));
    
  }
  
  void display(){
    fill(255);
    noStroke();
    
    //draw sphere 1
    pushMatrix();
      
      translate(rootX, rootY - 2.3*(rad1), rootZ); //rootY subtracted by radius so that root will be bottom of sphere
      box(rad1);
      
    popMatrix();
    
    //draw sphere 2
    pushMatrix();
      
      translate(rootX, rootY - ((rad1 * 2.5) + rad2), rootZ);
      box(rad2);
    
    popMatrix();
    
    //draw sphere 3
    pushMatrix();
    
      translate(rootX, rootY - ((rad1 * 2) + (rad2 * 2) + 0.95*rad3), rootZ);
      box(rad3);
    
    popMatrix();
  }
  
  
}
