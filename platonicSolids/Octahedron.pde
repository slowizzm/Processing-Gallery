class Octahedron
{

  // Octahedron
  float x, y, z;
  float radius;
  float vertexRadius;
  boolean showFaces;
  int currentColor;
  float a;
  PVector[] vert = new PVector[6];
  int[][] faces;

  Octahedron(float radius, float vertexRadius, boolean showFaces)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = showFaces;
    init();
  }

  Octahedron(float radius, float vertexRadius)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = true;
    init();
  }

  Octahedron(float radius)
  {
    this.radius = radius;
    this.vertexRadius = 0;
    this.showFaces = true;
    init();
  }

  // calculate geometry
  void init()
  {
    a = radius;
    vert[0] = new PVector( a, 0, 0 ); 
    vert[1] = new PVector( 0, a, 0 );
    vert[2] = new PVector( 0, 0, a ); 
    vert[3] = new PVector( -a, 0, 0 ); 
    vert[4] = new PVector( 0, -a, 0 ); 
    vert[5] = new PVector( 0, 0, -a );
  }

  // draws octahedron 
  void create()
  {
    // vertexes
    if (vertexRadius > 0)
    {
      for (int i=0; i<6; i++)
        vertexSphere(vert[i].x, vert[i].y, vert[i].z, vertexRadius);
    }

    if (!showFaces)
    {
      currentColor = g.fillColor;
      fill(0, 0, 0, 0);
    }

    beginShape(TRIANGLE_FAN); 
    vertex(vert[4].x, vert[4].y, vert[4].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    vertex(vert[2].x, vert[2].y, vert[2].z);
    vertex(vert[3].x, vert[3].y, vert[3].z);
    vertex(vert[5].x, vert[5].y, vert[5].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    endShape();

    beginShape(TRIANGLE_FAN);    
    vertex(vert[1].x, vert[1].y, vert[1].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    vertex(vert[2].x, vert[2].y, vert[2].z);
    vertex(vert[3].x, vert[3].y, vert[3].z);
    vertex(vert[5].x, vert[5].y, vert[5].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    endShape();

    if (!showFaces)
    {
      fill(currentColor);
    }
  }

  void vertexSphere(float x, float y, float z, float r)
  {
    pushMatrix();
    translate(x, y, z);
    sphere(r);
    popMatrix();
  }
}