int numRopes = 40;
int numNodes = 110;
Node[][] node = new Node[numRopes][numNodes];

Vec2 base_pos = new Vec2(3, 2);

Vec2 ObjPos = new Vec2(5, 6);
float ObjRadius = 1;



void setup() {
  size(500, 500);
  surface.setTitle("It works baby");
  scene_scale = width / 10.0f;
  
  for(int i = 0; i < numRopes; i++){
    for(int j = 0; j < numNodes; j++){
      node[i][j] = new Node(new Vec2(base_pos.x + (j * link_length) + i * link_length, base_pos.y));
    }
  }
}

// Node struct
class Node {
  Vec2 pos;
  Vec2 vel;
  Vec2 last_pos;
  boolean verticle;
  boolean horizontal;

  Node(Vec2 pos) {
    this.pos = pos;
    this.vel = new Vec2(0, 0);
    this.last_pos = pos;
    verticle = true;
    horizontal = true;
  }
}

// Link length
float link_length = 0.075;
float nodeTear = 3.1 * link_length;
float nodeTearHorizontal = 2.1 * link_length;
//float cross_link_length = sqrt((pow(link_length, 2) + pow(link_length, 2)));
// Nodes


// Gravity
Vec2 gravity = new Vec2(0, 10);


// Scaling factor for the scene
float scene_scale = width / 10.0f;

// Physics Parameters
int relaxation_steps = 10;
int sub_steps = 10;

void update_physics(float dt) {
  for(int i = 0; i < numRopes; i++){
    for(int j = 1; j < numNodes; j++){
      node[i][j].last_pos = node[i][j].pos;
      node[i][j].vel = node[i][j].vel.plus(gravity.times(dt));
      node[i][j].pos = node[i][j].pos.plus(node[i][j].vel.times(dt));
      //println(cross_link_length);
    }
  }
  
  
  Vec2 delta;
  float correction;
  // Constrain the distance between nodes to the link length
  for (int i = 0; i < relaxation_steps; i++) {
    
    detectCollision();
    //Verticle
    for(int r = 0; r < numRopes; r++){
      for(int j = 1; j < numNodes; j++){
          delta = node[r][j].pos.minus(node[r][j - 1].pos);
          float delta_len = delta.length();
          if(delta_len > nodeTear){
            node[r][j].verticle = false;
          }
          if(node[r][j].verticle){
            correction = delta_len - link_length;
              Vec2 delta_normalized = delta.normalized();
              node[r][j].pos = node[r][j].pos.minus(delta_normalized.times(correction / 2));
              node[r][j - 1].pos = node[r][j - 1].pos.plus(delta_normalized.times(correction / 2));
            }
           }
        }
    
    //Horizontal
    for(int r = 1; r < numRopes; r++){
      for(int j = 0; j < numNodes; j++){
        if(node[r][j].horizontal){
          delta = node[r][j].pos.minus(node[r - 1][j].pos);
          float delta_len = delta.length();
          if(delta_len > nodeTearHorizontal){
            node[r][j].horizontal = false;
          }
          if(node[r][j].horizontal){
          correction = delta_len - link_length;
            Vec2 delta_normalized = delta.normalized();
            node[r][j].pos = node[r][j].pos.minus(delta_normalized.times(correction / 2));
            node[r - 1][j].pos = node[r - 1][j].pos.plus(delta_normalized.times(correction / 2));
          }
        }
      }
    }
    
    
    for(int r = 0; r < numRopes; r++){
      node[r][0].pos = new Vec2(base_pos.x + r*link_length, base_pos.y);
    }
    
  }
  for(int i = 0; i < numRopes; i++){
    for(int j = 0; j < numNodes; j++){
      node[i][j].vel = node[i][j].pos.minus(node[i][j].last_pos).times(1 / dt);
    }
  }
}

boolean paused = true;

void keyPressed() {
  if (key == ' ') {
    paused = !paused;
  }
  if (key == 'd') {
    ObjPos.x += .1;
    //for(int i = 0; i < numRopes; i++){
    //  for(int j = 0; j < numNodes; j++){
    //    //node[i][j].vel.x += 1;
    //    ObjPos.x += 1;
    //  }
    //}
  }
  if (key == 'a') {
    ObjPos.x -= .1;
    //for(int i = 0; i < numRopes; i++){
    //  for(int j = 1; j < numNodes; j++){
    //    node[i][j].vel.x -= 1;
    //  }
    //}
  }
  
  if (key == 'w') {
    ObjPos.y -= .1;
    //for(int i = 0; i < numRopes; i++){
    //  for(int j = 1; j < numNodes; j++){
    //    node[i][j].vel.x -= 1;
    //  }
    //}
  }
  
  if (key == 's') {
    ObjPos.y += .1;
    //for(int i = 0; i < numRopes; i++){
    //  for(int j = 1; j < numNodes; j++){
    //    node[i][j].vel.x -= 1;
    //  }
    //}
  }
}

float time = 0;
void draw() {
  float dt = 1.0 / 20; //Dynamic dt: 1/frameRate;
  
  if (!paused) {
    for (int i = 0; i < sub_steps; i++) {
      time += dt / sub_steps;
      update_physics(dt / sub_steps);
    }
  }

  background(255);
  stroke(0);
  strokeWeight(2);

  // Draw Nodes (green with black outline)
  fill(0, 255, 0);
  stroke(0);
  strokeWeight(0.02 * scene_scale);
  //noStroke();
  
  //for(int i = 0; i < numRopes; i++){
  //    for(int j = 0; j < numNodes; j++){
  //    //fill(i * 5, 255, j *5);
  //    ellipse(node[i][j].pos.x * scene_scale, node[i][j].pos.y * scene_scale, 0.3 * scene_scale, 0.3 * scene_scale);
  //  }
  //}

  //stroke(0);
  strokeWeight(0.02 * scene_scale);
  for(int i = 0; i < numRopes; i++){
    for(int j = 1; j < numNodes; j++){
      if(node[i][j].verticle)
      line(node[i][j - 1].pos.x * scene_scale, node[i][j - 1].pos.y * scene_scale, node[i][j].pos.x * scene_scale, node[i][j].pos.y * scene_scale);
    }
  }
  
  for(int i = 0; i < numNodes; i++){
    for(int j = 1; j < numRopes; j++){
      if(node[j][i].horizontal)
      line(node[j - 1][i].pos.x * scene_scale, node[j - 1][i].pos.y * scene_scale, node[j][i].pos.x * scene_scale, node[j][i].pos.y * scene_scale);
    }
  }
  
  //for(int i = 0; i < numRopes - 1; i++){
  //  for(int j = 0; j < numNodes - 1; j++){
  //    line(node[i + 1][j + 1].pos.x * scene_scale, node[i + 1][j + 1].pos.y * scene_scale, node[i][j].pos.x * scene_scale, node[i][j].pos.y * scene_scale);
  //  }
  //}

  //for(int i = 1; i < numRopes; i++){
  //  for(int j = 0; j < numNodes - 1; j++){
  //    line(node[i - 1][j + 1].pos.x * scene_scale, node[i - 1][j + 1].pos.y * scene_scale, node[i][j].pos.x * scene_scale, node[i][j].pos.y * scene_scale);
  //  }
  //}
  
  fill(255, 0, 0);
  noStroke();
  //Draw object
  ellipse(ObjPos.x * scene_scale, ObjPos.y * scene_scale, ObjRadius * scene_scale, ObjRadius * scene_scale);
}
