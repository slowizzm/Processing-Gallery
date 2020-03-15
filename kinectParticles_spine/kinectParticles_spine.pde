import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.math.*;
import megamu.mesh.*;

KinectPV2 kinect;
KinectSkeleton kSkel;

Particles particles;

void setup() {
  fullScreen(P3D, 1);
  particles = new Particles();
  kSkel = new KinectSkeleton(new KinectPV2(this));
}

void draw() {
  background(0, 0, 33);
  kSkel.getSkeleton();

  particles.render();
}
