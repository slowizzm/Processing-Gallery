Icosahedron ico;
Tetrahedron tet;
Octahedron oct;
Dodecahedron dod;
Hexahedron hex;
Merkaba merk;

color baseColor;
color rootColor;
color sacralColor;
color solarColor;
color heartColor;
color throatColor;
color thirdEyeColor;
color crownColor;

void setup() 
{
  size(300, 800, P3D);
  blendMode(ADD);
  tet = new Tetrahedron(30, 10, true);
  merk = new Merkaba(30, 10, true);
  hex = new Hexahedron(30, 2, false);
  oct = new Octahedron(30, 2, true);
  dod = new Dodecahedron(30, 1, true);
  ico = new Icosahedron(30, 0, true);
  hint(DISABLE_DEPTH_TEST);
}

void draw() 
{
  background(0);
  lights();
  stroke(255, 150);
  noFill();
  
  
  pushStyle();
  pushMatrix();
  translate(width/2, 700, 0);
  rotateX(mouseY/100.);
  rotateY(mouseX/100.);
  hex.create();
  popMatrix();
  popStyle();

  pushStyle();
  stroke(255);
  pushMatrix();
  translate(width/2, 600, 0);
  rotateX(mouseY/100.);
  rotateY(mouseX/100.);
  ico.create();
  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  translate(width/2, 500, 0);
  rotateX(mouseY/100.);
  rotateY(mouseX/100.);
  tet.create();
  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  translate(width/2, 400, 0);
  rotateX(mouseY/100.);
  rotateY(mouseX/100.);
  oct.create();
  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  translate(width/2, 300, 0);
  rotateX(mouseY/100.);
  rotateY(mouseX/100.);
  dod.create();
  popMatrix();
  popStyle();

  pushStyle();
  pushMatrix();
  translate(width/2, 200, 0);
  rotateX(mouseY/100.);
  rotateY(mouseX/100.);
  merk.create();
  popMatrix();
  popStyle();

  pushStyle();
  strokeWeight(0.3);
  pushMatrix();
  translate(width/2, 100, 0);
  rotateY(map(mouseY, 0, height, height/2-3, height/2+3));
  rotateX(map(mouseX, 0, width, width/2-3, width/2+3));
  sphere(33);
  popMatrix();
  popStyle();
}