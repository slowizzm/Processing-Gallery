public class KinectSkeleton {
  KinectPV2 kinect;
  Vec2D bodyPos;
  AttractionBehavior particleAttractor;
  boolean isTracking = false;

  KinectSkeleton(KinectPV2 _kinect) {
    kinect = _kinect;
    kinect.enableSkeleton3DMap(true);
    kinect.init();
  }

  void getSkeleton() {
    pushMatrix();
    translate(width/2, height/2, 0);

    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();

    //individual JOINTS
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      if (skeleton.isTracked()) {
        isTracking = true;
        KJoint[] joints = skeleton.getJoints();

        setBodyPosAndAttractParticles(joints[KinectPV2.JointType_SpineBase]);
      } else {
        isTracking = false;
      }
    }
    popMatrix();
  }


  void setBodyPosAndAttractParticles(KJoint joint) {
    getBodyPos(joint);
    attractParticles();
  }


  void attractParticles() {  
    particles.physics.removeBehavior(particleAttractor);
    particleAttractor = new AttractionBehavior(bodyPos, 333, 13);
    particles.physics.addBehavior(particleAttractor);
  }

  void getBodyPos(KJoint joint) {
    bodyPos = new Vec2D(map(joint.getX(), -1.28, 1, 0, width), map(joint.getZ(), 1, 8, 0, height*2));
  }
}
