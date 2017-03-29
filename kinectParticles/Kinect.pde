import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;
 
KinectPV2 kinect;
KinectSkeleton kSkel;
 
public class KinectSkeleton {
 
 
  KinectSkeleton() {
    kinect.enableSkeleton3DMap(true);
    kinect.init();
  }
 
  void display() {
    pushMatrix();
    translate(width/2, height/2, 0);
 
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();
 
    //individual JOINTS
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      if (skeleton.isTracked()) {
        KJoint[] joints = skeleton.getJoints();
  
        drawBody(joints);
      }
    }
    popMatrix();
  }
}
 
void drawBody(KJoint[] joints) {
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_Head);
}
 
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
 
  float xMapped = map(joint.getX(), 0, 512, 0, width);
  //float yMapped = map(joint.getY(), 0, 424, 0, height);
  float zMapped = map(joints[jointType1].getZ(), 1, 8, 0, height*2);
  
  mousePos_particles = new Vec2D(xMapped, zMapped);
 
  particles.physics.removeBehavior(mouseAttractor_particles);
  mouseAttractor_particles = new AttractionBehavior(mousePos_particles, 333, 13);
  particles.physics.addBehavior(mouseAttractor_particles);
 
  //println(xMapped);
  //println(yMapped);
  //println(zMapped);
}
