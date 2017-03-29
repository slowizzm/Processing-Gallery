import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
KinectSkeleton kSkel;

class KinectSkeleton {

  KinectSkeleton() {
    //Enables depth and Body tracking (mask image)
    kinect.enableDepthMaskImg(true);
    kinect.enableSkeletonDepthMap(true);

    kinect.init();
  }

  void display() {

    //get the skeletons as an Arraylist of KSkeletons
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

    //individual joints
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      //if the skeleton is being tracked compute the skleton joints
      if (skeleton.isTracked()) {
        KJoint[] joints = skeleton.getJoints();

        drawBody(joints);
        //drawHandState(joints[KinectPV2.JointType_HandRight]);
        drawHandState(joints[KinectPV2.JointType_HandLeft]);
      }
    }
  }

  //draw the body
  void drawBody(KJoint[] joints) {
    //drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  }  

  //draw a bone from two joints
  void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  }

  void drawHandState(KJoint joint) {

    handState(joint.getState());

    float xMapped = map(joint.getX(), 0, 512, 0, width);
    float yMapped = map(joint.getY(), 0, 424, 0, height);
    //float zMapped = map(joint.getZ(), 1, 8, 0, height*2);


    mousePos_particles = new Vec2D(xMapped, yMapped);

    particles.physics.removeBehavior(mouseAttractor_particles);
    mouseAttractor_particles = new AttractionBehavior(mousePos_particles, 250, 13);
    particles.physics.addBehavior(mouseAttractor_particles);

    //println(xMapped);
    //println(yMapped);
    //println(zMapped);
  } 

  void handState(int handState) {
    switch(handState) {
    case KinectPV2.HandState_Open:      
      break;
    case KinectPV2.HandState_Closed:
      particles.physics.removeBehavior(mouseAttractor_particles);
      break;
      //case KinectPV2.HandState_Lasso:
      //  break;
    case KinectPV2.HandState_NotTracked:
      particles.physics.removeBehavior(mouseAttractor_particles);
      break;
    }
  }
}