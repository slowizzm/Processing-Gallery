float distancePoint;

void setup() 
{
  size(500, 500); 
  smooth();
  noStroke();
  blendMode(ADD);
  distancePoint = dist(33, 33, width, height);
}

void draw() 
{
  background(255, 142, 50);

  for (int i = 0; i<= width; i += 25) 
  {
    for (int j = 0; j <= width; j +=25) 
    {
      float sqrSize = dist(mouseX, mouseY, i, j);
      sqrSize = sqrSize/distancePoint * 30;
      rect(i, j, sqrSize, sqrSize);
    }
  }
  fill(0, 0, map(mouseY, 0, height, 167, 200));
}