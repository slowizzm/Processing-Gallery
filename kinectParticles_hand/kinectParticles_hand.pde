Particles particles;
AttractionBehavior mouseAttractor_particles;
Vec2D mousePos_particles;
AttractionBehavior mouseAttractor_P;
Vec2D mousePos_P;


import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinectDepth;
KinectSkeleton kSkel;

void setup() {
  fullScreen(P3D, 2);
  particles = new Particles();

  kSkel = new KinectSkeleton(new KinectPV2(this));
}

void draw() {
  background(0, 0, 33);
  kSkel.getSkeleton();

  particles.render();
}
