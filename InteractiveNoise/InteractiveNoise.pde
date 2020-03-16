GenerateNoise generateNoise;


void setup() {
  size(1920, 848, P3D);
  rectMode(CENTER);
  frameRate(60);

  blendMode(ADD);
  smooth();
  lights();

  generateNoise = new GenerateNoise();
}

void draw() {
  background(3, 11, 33);
  generateNoise.display(new PVector(mouseX, mouseY));
}
