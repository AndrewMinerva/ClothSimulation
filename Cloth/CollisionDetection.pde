void detectCollision(){
  for(int i = 0; i < numRopes; i++){
    for(int j = 0; j < numNodes; j++){
    Vec2 delta = node[i][j].pos.minus(ObjPos);
    float dist = delta.length();
    float overlap = dist - ObjRadius/2 - 0.1;
    if(overlap < 0){
      node[i][j].pos.subtract(delta.normalized().times(overlap));
      
      //Vec2 dir = delta.normalized();
      //float v1 = dot(node[i][j].vel, delta.normalized());
      //float v2 = 0;
      //float m1 = 1;
      //float m_obs = 1000000;
      //float new_v1 = (m1 * v1 + m_obs * v2 - m_obs * (v1 - v2) * 0.05) / (m1 + m_obs);
      //node[i][j].vel = node[i][j].vel.plus(dir.times(new_v1 - v1));
  }
  }
  }
}

//void detectCollision(){
//  for (int i = 0; i < numRopes; i++){
//     for (int j = 0; j < numNodes; j++){
//       float d = ObjPos.distanceTo(node[i][j].pos);
//       if(d < ObjRadius/2){
//       Vec2 n = ObjPos.minus(node[i][j].pos);
//       n.mul(-1);
//       n.normalize();
//       float a = dot(node[i][j].pos, n);
//       Vec2 bounce = n.times(a);
//       node[i][j].vel.minus(bounce.times(.01));
//       node[i][j].pos.add(n.times(.01 + ObjRadius/2 - d));
//       }
//     } 
//  }
//}

//void detectCollisionNodes(int row, int col){
//  for(int i = row + 1; i < numRopes; i++){
//    for(int j = col + 1; j < numNodes; j++){
      
//        Vec2 delta = node[row][col].pos.minus(node[i][j].pos);
//        float dist = delta.length();
//        //println(dist);
//        if(dist < 0){
//          float overlap = 0.5f;
//          node[row][col].pos.subtract(delta.normalized().times(overlap));
//          node[i][j].pos.add(delta.normalized().times(overlap));
//        }
      
//      if(node[row][col].pos == node[i][j].pos){
//        println("here");
//      }
//    }
//  }

//  }
