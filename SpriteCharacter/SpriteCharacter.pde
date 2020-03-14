// sprite image created by Sithjester

PImage spriteSheet;
JSONObject spriteData;
Player player;

boolean keyIsDown = false;

void setup() {
  size(500, 500);

  spriteData = loadJSONObject("deadpool.json");
  spriteSheet = loadImage("deadpool-sprite.png");
  player = new Player(new PVector(width*0.5, height*0.5));

  imageMode(CENTER);
  frameRate(12);
}

void draw() {
  clear();
  player.render();
}

void keyPressed() {
  if (!keyIsDown) {    
    if (keyCode == UP || key == 'w' || key == 'W') {
      //console.log('key up');
      player.state = "move-up";
      player.idx = 12;
    } else if (keyCode == DOWN || key == 's' || key == 'S') {
      //console.log('key down');
      player.state = "move-down";
      player.idx = 0;
    } else if (keyCode == LEFT || key == 'a' || key == 'A') {
      //console.log('key left');
      player.state = "move-left";
      player.idx = 4;
    } else if (keyCode == RIGHT || key == 'd' || key == 'D') {
      //console.log('key right');
      player.state = "move-right";
      player.idx = 8;
    }

    keyIsDown = true;
  }
}

void keyReleased() {
  player.state = "idle";

  keyIsDown = false;
}
