int SCREEN_WIDTH = 1366;
int SCREEN_HEIGHT = 768;
int DROPLET_HEIGHT = 16;
int DROPLET_WIDTH = 4;
int DROPLETS = SCREEN_HEIGHT;
color DROPLET_COLOR = color(93, 245, 249);
int SPEED_RANGE = 10;
int SPEED_MINIMUM = 2;

class Droplet {
 int x_pos;
 int y_pos;
 int h;
 int w;
 int fall_speed;
 
 Droplet(int heigh, int widt, int x, int speed) {
   h = heigh;
   w = widt;
   x_pos = x;
   y_pos = -DROPLET_HEIGHT;
   fall_speed = speed;
  fill(DROPLET_COLOR);
  rect(x_pos, y_pos, 12, 2);
 }
 
 void draw() {
  fill(DROPLET_COLOR);
  rect(x_pos, y_pos, w, h);
  noStroke();
  y_pos += fall_speed; 
 }  
} // Droplet

int randomSpeed() {
 return int(random(SPEED_RANGE)) + SPEED_MINIMUM; 
}

int randomXPos() {
  return int(random(SCREEN_WIDTH));
}

Droplet createDroplet() {
  return new Droplet(DROPLET_HEIGHT, DROPLET_WIDTH, randomXPos(), randomSpeed());
}

Droplet createStartingDroplet() {
  Droplet d = new Droplet(DROPLET_HEIGHT, DROPLET_WIDTH, randomXPos(), randomSpeed()); 
  d.y_pos = int(random(SCREEN_HEIGHT));
  return d;
}


// main
Droplet[] droplets;

void setup() {
  noCursor();
  fullScreen();
  background(0, 0, 0);
  
  droplets = new Droplet[DROPLETS];
  for (int i = 0; i < DROPLETS; i++) {
   droplets[i] = createStartingDroplet();
  }
}

int y = 0;

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < DROPLETS; i++) {
    droplets[i].draw();
    if (droplets[i].y_pos > SCREEN_HEIGHT) {
      droplets[i] = createDroplet();
    }
  }
}

void mouseClicked() {
 exit();
}
