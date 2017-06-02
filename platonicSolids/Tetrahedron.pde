class Tetrahedron
{

  // Tetrahedron
  float x, y, z;
  float radius;
  float vertexRadius;
  boolean showFaces;
  int currentColor;
  float a;
  PVector[] vert = new PVector[4];
  int[][] faces;

  Tetrahedron(float radius, float vertexRadius, boolean showFaces)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = showFaces;
    init();
  }

  Tetrahedron(float radius, float vertexRadius)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = true;
    init();
  }

  Tetrahedron(float radius)
  {
    this.radius = radius;
    this.vertexRadius = 0;
    this.showFaces = true;
    init();
  }

  // calculate geometry
  void init()
  {
    a = radius*0.6666;
    vert[0] = new PVector( a, a, a );  // vertex 1
    vert[1] = new PVector(-a, -a, a );    // vertex 2
    vert[2] = new PVector(-a, a, -a );  // vertex 3
    vert[3] = new PVector( a, -a, -a );   // vertex 4
  }

  // draws tetrahedron 
  void create()
  {
    // vertexes
    if (vertexRadius > 0)
    {
      for (int i=0; i<4; i++)
        vertexSphere(vert[i].x, vert[i].y, vert[i].z, vertexRadius);
    }

    if (!showFaces)
    {
      currentColor = g.fillColor;
      fill(0, 0, 0, 0);
    }
    beginShape(TRIANGLE_STRIP);
    vertex(vert[0].x, vert[0].y, vert[0].z);  // vertex 1
    vertex(vert[1].x, vert[1].y, vert[1].z);    // vertex 2
    vertex(vert[2].x, vert[2].y, vert[2].z);  // vertex 3
    vertex(vert[3].x, vert[3].y, vert[3].z);   // vertex 4
    vertex(vert[0].x, vert[0].y, vert[0].z);  // vertex 1
    vertex(vert[1].x, vert[1].y, vert[1].z);    // vertex 2
    vertex(vert[3].x, vert[3].y, vert[3].z);   // vertex 4
    vertex(vert[2].x, vert[2].y, vert[2].z);  // vertex 3
    vertex(vert[1].x, vert[1].y, vert[1].z);    // vertex 2
    endShape(CLOSE);
    if (!showFaces)
    {
      fill(currentColor);
    }
  }

  void vertexSphere(float x, float y, float z, float r)
  {
    pushMatrix();
    translate(x, y, z);
    sphere(r/7);
    popMatrix();
  }
}