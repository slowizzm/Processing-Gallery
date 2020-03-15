int num = 18;
int edgeLength = 20;

Tet tetrahedron;

void setup() {
  size(800, 800, P3D);

  tetrahedron = new Tet(width/2, height/2, 0, edgeLength);
}

void draw() {
  background(0);

  if (keyPressed) {
    if (key==32) {
      fill(255);
      noStroke();
      directionalLight(255, 0, 0, -1, 1, 0);
      directionalLight(200, 200, 255, 0, -1, 0);
    }
  } else {
    noFill();
    stroke(233);
  }
  directionalLight(0, 0, 255, 0, 0, -1);

  pushMatrix();
  tetrahedron.makeShape();
  popMatrix();
}
