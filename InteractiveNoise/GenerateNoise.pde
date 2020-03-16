class GenerateNoise {
  float theta = 0.0, rotSqr = 0.0;
  GenerateNoise() {
    noiseDetail(3, 0.9);
  }

  private void display(PVector attr) {
    rotSqr = 0.3;
    for (int x = 10; x < width; x += 7) {
      for (int y = 10; y < height; y += 7) {
        float n = noise(x * 0.003, y * 0.003, theta * 0.003);
        float rectDist = dist(attr.x, attr.y, x, y);
        pushMatrix();
        translate(x, y);
        rotate(TWO_PI * n);
        scale(10 * n);
        pushStyle();
        fill(210, 180, 33);
        noStroke();
        rect(0, 0, map(rectDist, 0, width, 0, 17), map(rectDist, 0, width, 0, 17));
        popStyle();
        popMatrix();
      }
    }
    theta += rotSqr;
  }
}
