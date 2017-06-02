float minTime;        // minimum time
float maxTime;        // maximum time 
float currentTime;    // current time   
float spdTime;        // speed of time
float directionTime;  // directon of time

private class Counter 
{

  Counter() 
  {

    minTime = 0.0;
    maxTime = 300.0;
    currentTime = 100.0;
    spdTime = 0.5; 
    directionTime = 1.0;
  }

  private void run() 
  {
    currentTime = currentTime + ( spdTime * directionTime);
    
    if (currentTime >= maxTime || currentTime <= minTime) 
    {
      directionTime *= -1.0;
    }
    pushMatrix();
    translate(width/2, height/2);
    box(currentTime);
    popMatrix();
    println(currentTime);
  }
}