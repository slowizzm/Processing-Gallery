float x;
void setup() {

  size(700, 700, P3D);
  surface.setLocation(0,0);
}

void draw() {
  background(255);
  //pushMatrix();
  //translate(width/2, height/2);
  
  //rotateZ(x);
  x = x + 0.1;
  stroke(0);
  strokeWeight(333);
  noFill();
  pushMatrix();
  translate(width/2, height/2, 300);
  float _ = 1.618033; //golden mean
  float __ = 0.618033;
  PVector[] dodecahedron = {
    new PVector(0, __, _), 
    new PVector(0, __, -_), 
    new PVector(0, -__, _), 
    new PVector(0, -__, -_), 
    new PVector(_, 0, __), 
    new PVector(_, 0, -__), 
    new PVector(-_, 0, __), 
    new PVector(-_, 0, -__), 
    new PVector(__, _, 0), 
    new PVector(__, -_, 0), 
    new PVector(-__, _, 0), 
    new PVector(-__, -_, 0), 
    new PVector(1, 1, 1), 
    new PVector(1, 1, -1), 
    new PVector(1, -1, 1), 
    new PVector(1, -1, -1), 
    new PVector(-1, 1, 1), 
    new PVector(-1, 1, -1), 
    new PVector(-1, -1, 1), 
    new PVector(-1, -1, -1)
  };
  float p = 1;
  for (int i=1; i<dodecahedron.length-1; i++) {

    line(dodecahedron[i].x*p, dodecahedron[i].y*p, dodecahedron[i].z*p, dodecahedron[i+1].x*p, dodecahedron[i+1].y*p, dodecahedron[i+1].z*p);
  }
  popMatrix();
  //popMatrix();
  //camera(10,0,0,0,0,0,0, 1, 0);
}