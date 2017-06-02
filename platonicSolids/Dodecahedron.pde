class Dodecahedron
{

  // Dodecahedron
  float x, y, z;
  float radius;
  float vertexRadius;
  boolean showFaces;
  int currentColor;
  float a, b, c;
  PVector[] vert;
  int[][] faces;

  Dodecahedron(float radius, float vertexRadius, boolean showFaces)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = showFaces;
    init();
  }

  Dodecahedron(float radius, float vertexRadius)
  {
    this.radius = radius;
    this.vertexRadius = vertexRadius;
    this.showFaces = true;
    init();
  }

  Dodecahedron(float radius)
  {
    this.radius = radius;
    this.vertexRadius = 0;
    this.showFaces = true;
    init();
  }

  // calculate geometry
  void init()
  {
    a = radius/1.618033989;
    b = radius;
    c = 0.618033989*a;
    faces = new int[12][5];
    vert = new PVector[20];
    vert[ 0] = new PVector(a, a, a);
    vert[ 1] = new PVector(a, a, -a);
    vert[ 2] = new PVector(a, -a, a);
    vert[ 3] = new PVector(a, -a, -a);
    vert[ 4] = new PVector(-a, a, a);
    vert[ 5] = new PVector(-a, a, -a);
    vert[ 6] = new PVector(-a, -a, a);
    vert[ 7] = new PVector(-a, -a, -a);
    vert[ 8] = new PVector(0, c, b);
    vert[ 9] = new PVector(0, c, -b);
    vert[10] = new PVector(0, -c, b);
    vert[11] = new PVector(0, -c, -b);
    vert[12] = new PVector(c, b, 0);
    vert[13] = new PVector(c, -b, 0);
    vert[14] = new PVector(-c, b, 0);
    vert[15] = new PVector(-c, -b, 0);
    vert[16] = new PVector(b, 0, c);
    vert[17] = new PVector(b, 0, -c);
    vert[18] = new PVector(-b, 0, c);
    vert[19] = new PVector(-b, 0, -c);

    faces[ 0] = new int[] {0, 16, 2, 10, 8};
    faces[ 1] = new int[] {0, 8, 4, 14, 12};
    faces[ 2] = new int[] {16, 17, 1, 12, 0};
    faces[ 3] = new int[] {1, 9, 11, 3, 17};
    faces[ 4] = new int[] {1, 12, 14, 5, 9};
    faces[ 5] = new int[] {2, 13, 15, 6, 10};
    faces[ 6] = new int[] {13, 3, 17, 16, 2};
    faces[ 7] = new int[] {3, 11, 7, 15, 13};
    faces[ 8] = new int[] {4, 8, 10, 6, 18};
    faces[ 9] = new int[] {14, 5, 19, 18, 4};
    faces[10] = new int[] {5, 19, 7, 11, 9};
    faces[11] = new int[] {15, 7, 19, 18, 6};
  }

  // draws dodecahedron 
  void create()
  {
    // vertexes
    if (vertexRadius > 0)
    {
      for (int i=0; i<20; i++)
        vertexSphere(vert[i].x, vert[i].y, vert[i].z, vertexRadius);
    }

    if (!showFaces)
    {
      currentColor = g.fillColor;
      fill(0, 0, 0, 0);
    }

    for (int i=0; i<12; i++)
    {
      beginShape();
      for (int j=0; j<5; j++)
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