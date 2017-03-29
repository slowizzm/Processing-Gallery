Particles particles;
AttractionBehavior mouseAttractor_particles;
Vec2D mousePos_particles;
AttractionBehavior mouseAttractor_P;
Vec2D mousePos_P;

void setup() {
  fullScreen(P3D, 2);
  particles = new Particles();

  kinect = new KinectPV2(this);
  kSkel = new KinectSkeleton();
}

void draw() {
  background(0, 0, 33);
  kSkel.display();

  particles.physics.update();
  particles.drawParticles();
  particles.drawLines();
}