class Star{
  float rotate_star;
  PShape object;
  float x;
  float y;
  float angle_speed;
  float radius1;
  float radius2;
  int npoints;
  color c;
  
  
  Star(float x, float y, float radius1, float radius2, int npoints, float angle_speed, color c) {
    this.x = x;
    this.y = y;
    this.radius1 = radius1;
    this.radius2 = radius2;
    this.npoints = npoints;
    this.angle_speed = angle_speed;
    this.rotate_star = 0;
    this.c = c;
  }
  
  void display() {
    fill(c);
    pushMatrix();
    rotateY(rotate_star);
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy, 0);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy, 0);
    }
    
    endShape(CLOSE);
    
    popMatrix();
    rotate_star += angle_speed;
  }
}
