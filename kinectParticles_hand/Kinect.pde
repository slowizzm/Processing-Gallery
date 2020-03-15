class KinectSkeleton {
  boolean isTracking = false;
  Vec2D handPos;
  AttractionBehavior particleAttractor;
  KinectPV2 kinect;

  KinectSkeleton(KinectPV2 _kinect) {
    kinect = _kinect;
    kinect.enableSkeletonDepthMap(true);
    kinect.init();
  }

  void getSkeleton() {

    //get the skeletons as an Arraylist of KSkeletons
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

    //individual joints
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      //if the skeleton is being tracked compute the skleton joints
      isTracking = false;
      if (skeleton.isTracked()) {
        isTracking = true;
        KJoint[] joints = skeleton.getJoints();

        getHandJoint(joints[KinectPV2.JointType_HandLeft]);
      } else {
        isTracking = false;
      }
    }
  }

  void setHandPos(KJoint joint) {
    handPos = new Vec2D(map(joint.getX(), 0, 512, 0, width), map(joint.getY(), 0, 424, 0, height));
  }

  void getHandJoint(KJoint joint) {
    handState(joint.getState());
    setHandPos(joint);
  }

  void handState(int handState) {
    switch(handState) {
    case KinectPV2.HandState_Open:   
      particles.physics.removeBehavior(particleAttractor);
      particleAttractor = new AttractionBehavior(handPos, 250, 13);
      particles.physics.addBehavior(particleAttractor);
      break;
    case KinectPV2.HandState_Closed:
      particles.physics.removeBehavior(particleAttractor);
      break;
    case KinectPV2.HandState_NotTracked:
      particles.physics.removeBehavior(particleAttractor);
      break;
    }
  }
}
