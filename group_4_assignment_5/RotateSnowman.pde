class BoxSnowman extends Snowman {
  //oscillation speed
  float rotateSpeed;
  
  //white snowball thrown at the screen
  Ball snowBall;

  BoxSnowman(float x, float y, float z, float r1, float r2, float r3, float rotation, float _rotateSpeed, float snowBallSize) {

    super(x, y, z, r1, r2, r3, rotation, color(255));

    rotateSpeed = _rotateSpeed;
    snowBall = new Ball(rootX, (rootY - ((rad1 * 2.5) + rad2)), rootZ, 1.0, 0.0, 0.0, snowBallSize, color(255));
    
  }
  
  //draw box snowman and the snowball it throws
  void display() {
    fill(255);
    noStroke();

    //draw bottom box
    pushMatrix();
    translate(rootX, rootY - 2.3*(rad1), rootZ); //rootY subtracted by radius so that root will be bottom of sphere
    rotateY(sq(cos(rotateAmount)) - PI / 8);
    box(rad1);
    popMatrix();

    //draw middle box
    pushMatrix();
    translate(rootX, rootY - ((rad1 * 2.5) + rad2), rootZ);
    rotateY(sq(cos(rotateAmount)) - PI / 8);
    
    //ball throwing at camera, increases in frequency over time.
    pushMatrix();
    rotateY(-PI/2);
    translate(-140, -280, -10);
    snowBall.applyForces(0.01, 0, 0);
    snowBall.display();
    
    //return ball to original position
    if(snowBall.pos.x > rad2 * 12){
      snowBall.pos.x = rootX;
      snowBall.pos.y = (rootY - ((rad1 * 2.5) + rad2));
    }
    popMatrix();
    box(rad2);
    popMatrix();

    //draw top box
    pushMatrix();
    translate(rootX, rootY - ((rad1 * 2) + (rad2 * 2) + 0.95*rad3), rootZ);
    rotateY(sq(cos(rotateAmount)) - PI / 8);
    box(rad3);
    popMatrix();

    //increase RotateAmount to make oscillations happen
    rotateAmount += rotateSpeed;
  }

  
  
}
