class Present {
  PShape object;
  float x;
  float y;
  float jump;
  
  float lerpFactor;
  float fallIncrement;
  float startHeight; 
  boolean ascending;
  
  color c;
  
  Star star;
  
  
  Present(String object_name_1, float x, float y, float jump, float lerpFactor, float angle_speed, float radius1, float radius2, int npoints, color c) {
    this.object = loadShape(object_name_1);
    this.x = x;
    this.y = y;
    this.jump = jump;
    this.lerpFactor = lerpFactor;
    ascending = false;
    fallIncrement = 1;
    startHeight = y;
    this.star = new Star(0, 0, radius1, radius2, npoints, angle_speed, c);
    
    
  }
  
  void build() {
    object.rotateX(PI);
  }
  
  void display() {
    shape(object, x, y, object.width*22.5, object.height*22.5);
    pushMatrix();
    translate(x, y-100, 0);
    star.display();
    popMatrix();

  }
  
  void move() {
    
    if (ascending) {
      if (y <= jump + 1) {
        ascending = false;
      }
    }
    
    else if (y >= startHeight - 1) {
      y = startHeight;
      fallIncrement = 1;
      ascending = true;
    }
    
    if (ascending) {
      ascend();
    }
    
    else {
      descend();
    }
  }
  
  void ascend() {
    float newY = lerp(y, jump, lerpFactor);
    y = newY;
  }
  
  void descend() {
    y += fallIncrement;
    
    fallIncrement *= (1 + lerpFactor);
  }
}
