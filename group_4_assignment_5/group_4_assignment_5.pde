CircleSnowman snowman2;
BoxSnowman snowman1;

void setup() {

  size(500, 500, P3D);
  
  snowman2 = new CircleSnowman(350.0, 450.0, 0.0, 
    60.0, 40.0, 25.0, 
    350.0, 0.2, 0.1);

  snowman1 = new BoxSnowman(150.0, 550.0, 0.0, 
    90.0, 60.0, 37.5, 
    350.0, 0.01, 15);
}



void draw() {

  background(10);
  lights();

  snowman1.display();

  snowman2.move();
  snowman2.display();
}
