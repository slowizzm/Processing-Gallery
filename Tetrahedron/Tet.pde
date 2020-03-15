class Tet {
  int x, y, z;
  int edgeLength;
  float counter;
  float theta, angleX, angleY, rx, ry;
  boolean selected=false;

  Tet(int ix, int iy, int iz, int iedgeLength) {
    x = ix;
    y = iy;
    z = iz;
    edgeLength = iedgeLength;
  }

  void makeShape() {
    translate(x, y);

    theta = frameCount/TWO_PI;

    float dx = x-mouseX;
    float dy = y-mouseY;
    float d = (sqrt(dx*dx+dy*dy));

    if (d < edgeLength*2) {
      counter = 200;
      angleX = ((theta)*0.1);
      angleY = ((theta)*0.1);
      rotateY(angleX);
      rotateX(angleY);
    } else {
      counter-=0.5;
      rx = (rx*0.95)+(angleX*0.1);
      ry = (ry*0.95)+(angleY*0.1);
      rotateX(rx);
      rotateY(ry);
    }
    beginShape(TRIANGLE_STRIP);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    vertex(-edgeLength, edgeLength, -edgeLength);
    vertex(edgeLength, -edgeLength, -edgeLength);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    endShape(CLOSE);
  }
}
