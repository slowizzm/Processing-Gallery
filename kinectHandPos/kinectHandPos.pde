import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinectDepth;
KinectSkeleton kSkelDepth;

void setup() {
  fullScreen(2);

  kSkelDepth = new KinectSkeleton(new KinectPV2(this));
}

void draw() {
  background(0, 0, 33);
  kSkelDepth.getSkeleton();
}
