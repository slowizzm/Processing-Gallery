class Hexahedron
{

  // Tetrahedron
  float x, y, z;
  float radius;
  float vertexRadius;
  boolean showFaces;
  int currentColor;
  float a;
  PVector[] vert = new PVector[8];
  int[][] faces;

  Hexahedron(float radius, float vertexRadius, boolean showFaces)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = showFaces;
    init();
  }

  Hexahedron(float radius, float vertexRadius)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = true;
    init();
  }

  Hexahedron(float radius)
  {
    this.radius = radius;
    this.vertexRadius = 0;
    this.showFaces = true;
    init();
  }

  // calculate geometry
  void init()
  {
    a = radius/1.1414;
    faces = new int[6][4];
    vert[0] = new PVector(  a, a, a );
    vert[1] = new PVector(  a, a, -a );
    vert[2] = new PVector(  a, -a, -a );
    vert[3] = new PVector(  a, -a, a );
    vert[4] = new PVector( -a, -a, a );
    vert[5] = new PVector( -a, a, a );
    vert[6] = new PVector( -a, a, -a );
    vert[7] = new PVector( -a, -a, -a );

    faces[0] = new int[] {0, 1, 2, 3};
    faces[1] = new int[] {4, 5, 6, 7};
    faces[2] = new int[] {0, 3, 4, 5};
    faces[3] = new int[] {1, 2, 7, 6};
    faces[4] = new int[] {2, 3, 4, 7};
    faces[5] = new int[] {0, 5, 6, 1};
  }

  // draws hexahedron 
  void create()
  { 
    // vertexes
    if (vertexRadius > 0)
    {
      for (int i=0; i<8; i++)
        vertexSphere(vert[i].x, vert[i].y, vert[i].z, vertexRadius);
    }

    if (!showFaces)
    {
      currentColor = g.fillColor;
      fill(0, 0, 0, 0);
    }

    for (int i=0; i<6; i++)
    {
      beginShape();
      for (int j=0; j<4; j++)
      {
        vertex(vert[faces[i][j]].x, vert[faces[i][j]].y, vert[faces[i][j]].z);
      }
      endShape();
    }

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