import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import megamu.mesh.*;

public class Particles {
  int NUM_PARTICLES = 1300;

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
    polygons = new int[NUM_PARTICLES];
    // the NEW way to add gravity to the simulation, using behaviors
    physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.0f)));
    for (int i = 0; i<NUM_PARTICLES; i++) {
      addParticle();
    }
  }
  void addParticle() {
    VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(1500).addSelf(width / 3, 0));
    physics.addParticle(p);
    // add a negative attraction force field around the new particle
    physics.addBehavior(new AttractionBehavior(p, 3, 3f, 0.01f));
  }

  void drawParticles() {
    // store particles positions to do delaunay triangulation
    pos = new float[NUM_PARTICLES][2];

    for ( int i=0; i<NUM_PARTICLES; i++) {
      // particle system using verlet integration
      VerletParticle2D p = physics.particles.get(i);
      rectMode(CENTER);
      pushStyle();
      noStroke();
      fill(255, 33, 33, 33);
      ellipse(p.x, p.y, p.y/33,p.y/33);
      popStyle();

      pos[i][0] = physics.particles.get(i).x;
      pos[i][1] = physics.particles.get(i).y;
    }
  }

  // delaunay triangulation logic taken from here : 
  // http://www.openprocessing.org/sketch/43503
  void drawLines() {
    // delaunay triangulation
    delaunay = new Delaunay(pos);
    // getEdges returns a 2 dimensional array for the lines
    float[][] edges = delaunay.getEdges();
    for (int i=0; i<edges.length; i++)
    {
      // use the edges values to draw the lines
      float startX = edges[i][0];
      float startY = edges[i][1];
      float endX = edges[i][2];
      float endY = edges[i][3];
      float distance = dist(startX, startY, endX, endY);
      // remap the distance to opacity values
      float trans = 255-map(distance, 0, 33, 0, 255);
      // stroke weight based on distance
      // fast invert square root helps for performance
      float sw = 3f/sqrt(distance*3);
      pushStyle();
      strokeWeight(sw);
      stroke(255, trans);
      line(startX, startY, endX, endY);
      popStyle();
    }
  }
}