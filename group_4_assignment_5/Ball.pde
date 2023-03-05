class Ball {
  PVector pos;
  PVector vel;
  float r;
  color c;
  
  Ball(float x, float y, float z, 
    float vx, float vy, float vz, float _r, color _c) {
    pos = new PVector(x, y, z);
    vel = new PVector(vx, vy, vz);
    r = _r;
    c = _c;
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
  
  void display() {
    fill(c);
    
    pushMatrix();
    translate(pos.x + vel.x, pos.y + vel.y, pos.z + vel.z);
    sphere(r);
    popMatrix();
  }
}
