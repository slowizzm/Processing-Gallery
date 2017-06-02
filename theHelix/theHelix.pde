Helix helix;

void setup() 
{
  size(800, 800, P3D);
  smooth(8);
  helix = new Helix(333);
}

void draw() 
{
  background(255);
  helix.display(width/2, height/2);  
}
