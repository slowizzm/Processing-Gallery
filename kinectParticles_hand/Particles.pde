class Particles {
  int NUM_PARTICLES = 3000;

  VerletPhysics2D physics;
  AttractionBehavior mouseAttractor;
  float [][] pos;
  Vec2D mousePos;
  Delaunay delaunay;
  int [] polygons;

  Particles() {
    physics = new VerletPhysics2D();
    physics.setDrag(0.2);
    physics.setWorldBounds(new Rect(0, 0, width, height));
    //physics.setWorldBounds(new Rect(width/2-33, 0, 90, height));
    polygons = new int[NUM_PARTICLES];
    // the NEW way to add gravity to the simulation, using behaviors
    physics.addBehavior(new GravityBehavior(new Vec2D(0, 0f)));
    for (int i = 0; i<NUM_PARTICLES; i++) {
      addParticle();
    }
  }
  void addParticle() {
    VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(666).addSelf(width / 2, random(height)));
    physics.addParticle(p);
    // add a negative attraction force field around the new particle
    physics.addBehavior(new AttractionBehavior(p, 0.3, 3f, 0.01f));
  }

  void drawParticles() {
    // store particles positions to do delaunay triangulation
    pos = new float[NUM_PARTICLES][2];

    for ( int i=0; i<NUM_PARTICLES; i++) {
      // particle system using verlet integration
      VerletParticle2D p = physics.particles.get(i);

      pos[i][0] = physics.particles.get(i).x;
      pos[i][1] = physics.particles.get(i).y;

      if (p.x < 0) {
        p.x = width;
      } 
      if (p.x > width) {
        p.x = 0;
      } 
      if (p.y < 0) {
        p.y = height;
      } 
      if (p.y > height) {
        p.y = 0;
      }
    }
  }

  // delaunay triangulation logic taken from here : 
  void drawLines() {
    // delaunay triangulation
    delaunay = new Delaunay(pos);
    // getEdges returns a 2 dimensional array for the lines
    float[][] edges = delaunay.getEdges();
    for (int i=0; i<edges.length; i++) {
      // use the edges values to draw the lines
      float startX = edges[i][0];
      float startY = edges[i][1];
      float endX = edges[i][2];
      float endY = edges[i][3];

      float startX2 = edges[i][0];
      float startY2 = edges[i][3];
      float endX2 = edges[i][1];
      float endY2 = edges[i][3];

      float distance = dist(startX, startY, endX, endY);
      // remap the distance to opacity values
      float trans = 255-map(distance, 0, 33, 0, 255);
      // stroke weight based on distance
      // fast invert square root helps for performance
      float sw = 3f/sqrt(distance*3);

      pushStyle();
      strokeWeight(sw);
      stroke(233, 113, 33, trans);
      line(startX, startY, endX, endY);
      popStyle();
      pushStyle();
      ellipseMode(CENTER);
      noStroke();
      fill(133, 1);
      ellipse(startX2, startY2, endX2/23, endY2/23);
      popStyle();
    }
  }

  void render() {
    physics.update();
    drawParticles();
    drawLines();
  }
}
