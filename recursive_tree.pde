float red = 100;
float g = 150;
float b = 50;
float w;
int rs;
float rl = 2;
ArrayList<Coordinates> endpoints = new ArrayList<Coordinates>();

void setup() {
  size(500, 700);
  frameRate(1);
}

void draw() {
  randomSeed(227);
 background(200,200,255);
 
  drawTrees(); //this draws the trees
  save("tree.png");
}

float theta;
void drawTrees() {
  float lengthbranch;
  lengthbranch = 80;
 // line(250, 800, 250, 600);
  makeBranch(lengthbranch, 270, 250, 600 );
  randomSeed(rs+100); //sets lengthbranch and initaiates the branch making proccess
}

void makeBranch(float r, float theta, float x, float y) {
 
  
  if (r > rl) { //makes sure r is above a certain valie
    float red = 255 - r*4;
    float green = 255 - r*2;
    stroke(red, green, 42);
    strokeWeight(r/10.0); //sets strokeweight according to the length of the line
    float angle = theta + random(-900.0/r, 900.0/r);
    theta = radians(angle);
    float newx = w+x+r*cos(theta);
    float newy = w+y+r*sin(theta);
    float inewx = w+x+r*cos(-1*theta);
    float inewy = w+y+r*sin(theta);
    line(x, y, inewx, inewy);
    line(x, y, newx, newy); //randomizes angles and draws two new lines
    r *= 0.8; //shrinks branch length

    makeBranch(r, angle, inewx, inewy);
    makeBranch(r, angle, newx, newy); //restarts the makeBranch function with new inputs
  } else { 
    endpoints.add(new Coordinates(x, y)); 
  }
}

class Coordinates {
 float x, y; 
 
 Coordinates(float ix, float iy) {
   x = ix;
   y = iy;
 }
}