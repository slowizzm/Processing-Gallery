class Helix {

  float yoff;
  float radius;

  Helix(float _r) {
    yoff = 0.0;
    radius = _r;
  }
  void display(float _x, float _y) {
        pushMatrix();
        pushStyle();
        translate(_x, _y, 0);
        beginShape(TRIANGLE_STRIP);
        stroke(0,0,33,33);
        strokeWeight(1);
        float xoff = 0;
        for (float a = 0; a < TWO_PI; a+=0.003) {
          float offset = map(noise(xoff, yoff), 0, 7, 33, 333);
          float r = radius - offset;
          float x = r * cos(a*333);
          float y = r * sin(abs(a*3)*map(mouseX, 0, width, 33, 33.3));
          vertex(x, y);
          xoff += 0.003;
        }
        endShape();

        yoff += 0.00333;
        popStyle();
        popMatrix();
      }
    }