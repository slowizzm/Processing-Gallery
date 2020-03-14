class Player {
  PVector pos;
  int idx;
  String state;
  ArrayList<PImage> anim = new ArrayList<PImage>();
  Player(PVector p) {
    pos = new PVector(p.x, p.y);
    idx = 0;
    state = "idle";


    JSONArray frames = spriteData.getJSONArray("frames");

    for (int i = 0; i < frames.size(); i++) {
      JSONObject frame = frames.getJSONObject(i);
      JSONObject position = frame.getJSONObject("position");
      int x = position.getInt("x");
      int y = position.getInt("y");
      int w = position.getInt("w");
      int h = position.getInt("h");
      PImage img = spriteSheet.get(x, y, w, h);
      anim.add(img);
    }
  }

  void update() {
    switch (state) {
    case "idle":
      //idx = 0;
      break;

    case "move-left":
      idx = idx >= 7 ? 4 : idx++;
      break;

    case "move-right":
      idx = idx >= 11 ? 8 : idx++;
      break;

    case "move-up":
      idx = idx >= 15 ? 12 : idx++;
      break;

    case "move-down":
      idx =  idx >= 3 ? 0 : idx++;
      break;
    }
  }

  void move() {

    switch (state) {
    case "idle":
      break;

    case "move-left":
      pos.x -= 10;
      break;

    case "move-right":
      pos.x += 10;
      break;

    case "move-up":
      pos.y -= 10;
      break;

    case "move-down":
      pos.y += 10;
      break;
    }
  }

  void wrap() {
    if (pos.x < -30) {
      pos.x = width;
    } else if (pos.x > width + 30) {
      pos.x = 0;
    } else if (pos.y < -30) {
      this.pos.y = height;
    } else if (pos.y > height + 30) {
      pos.y = 0;
    }
  }


  void display() {
    image(anim.get(idx), pos.x, pos.y);
  }

  void render() {
    display();
    move();
    update();
    wrap();
  }
}
