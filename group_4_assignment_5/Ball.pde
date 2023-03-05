class Snowball {
  PVector pos;
  PVector vel;
  float r;
  color c;
  
  Snowball(float x, float y, float z, 
    float vx, float vy, float vz, float _r) {
    pos = new PVector(x, y, z);
    vel = new PVector(vx, vy, vz);
    r = _r;
    c = color(255);
  }
  void applyForces(float fx, 
    float fy, float fz) {
    vel.x += fx;
    vel.y += fy;
    vel.z += fz;
    pos.x += vel.x;
    pos.y += vel.y;
    pos.z += vel.z;    
  }
  
  void move(){
    pushMatrix();
    translate(pos.x + vel.x, pos.y + vel.y, pos.z + vel.z);
    popMatrix();
  }
  
  void display() {
    fill(c);
    
    pushMatrix();
    sphere(r);
    popMatrix();
  }
}
