Particles p;
AttractionBehavior mouseAttractor_P;
Vec2D mousePos_P;

void setup() {
  size(1024, 768, P3D);
  blendMode(ADD);
  frameRate(60);
  p = new Particles();
}



void draw() {
  background(33);
  noStroke();
  p.physics.update();
  p.drawParticles();
  p.drawLines();
}



void mousePressed() {
  mousePos_P = new Vec2D(mouseX, mouseY);

  if (mouseButton == LEFT) {
    mouseAttractor_P = new AttractionBehavior(mousePos_P, 250, 7);
    p.physics.addBehavior(mouseAttractor_P);
  }

  if (mouseButton == RIGHT) {
    mouseAttractor_P = new AttractionBehavior(mousePos_P, -33, -1);
    p.physics.addBehavior(mouseAttractor_P);
  }
}

void mouseDragged() {
  mousePos_P.set(mouseX, mouseY);
}

void mouseReleased() {
  p.physics.removeBehavior(mouseAttractor_P);
}
