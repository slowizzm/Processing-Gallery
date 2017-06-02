Counter counter;

void setup() 
{
  size(600,600,P3D);
  smooth();

counter = new Counter();
}

void draw() 
{
  background(0,0,33);
  counter.run();
}