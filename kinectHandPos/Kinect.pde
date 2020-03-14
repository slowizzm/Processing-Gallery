class KinectSkeleton {
  boolean isTracking = false;
  PVector handPos;
  String specificHand;
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

        drawHand(joints[KinectPV2.JointType_HandRight], "right");
        drawHand(joints[KinectPV2.JointType_HandLeft], "left");
      } else {
        isTracking = false;
      }
    }
  }

  void setHand(KJoint joint, String specifyHand) {
    specificHand = specifyHand;
    handPos = new PVector(map(joint.getX(), 0, 512, 0, width), map(joint.getY(), 0, 424, 0, height));
  }

  void drawHand(KJoint joint, String specifyHand) {
    setHand(joint, specifyHand);

    if (isTracking) visualizeHands();
  }

  void visualizeHands() {  
    pushMatrix();
    translate(handPos.x, handPos.y);
    pushStyle();
    noStroke();
    fill(242);
    ellipse(0, 0, 33, 33);
    fill(33);
    textAlign(CENTER);
    textSize(13);
    text(specificHand, 0, 0);
    popStyle();
    popMatrix();
  }
}
