class Player{
  
  float radius = 0.5;
  float x, y, phi, fov;
  
  Player(float x, float y, float phi, float fov){
    this.x   = x;
    this.y   = y;
    this.phi = phi;
    this.fov = fov;
  
  }
  
  void turn(float angle){ // angle > 0 => right turn
    phi += angle;
  }
  
  void walk(float amt){ // amt > 0 => walking forward
    float nx = x + amt*sin(phi);
    float ny = y - amt*cos(phi);
    if(map.objAtXY(nx,ny) == ' '){
      x = nx;
      y = ny;
    }
  }
  
  void strafe(float amt){ //amt > 0 => right strafe
    float nx = x + amt*sin(phi+PI/2);
    float ny = y - amt*cos(phi+PI/2);
    if(map.objAtXY(nx,ny) == ' '){
      x = nx;
      y = ny;
    }
  }
  
  boolean closeToObj(){
    if(map.objAtXY(x+radius, y) != ' ' || map.objAtXY(x-radius, y) != ' ' || map.objAtXY(x, y+radius) != ' ' || map.objAtXY(x, y-radius) != ' ') return true;
    return false;
  }
  
  float[][] castRays(Map map){
    float[][] rays = new float[res*16][2];
    for(int i = 0; i < res*16; i++){
      float theta = phi-0.5*fov + i*fov/(res*16);
      float r = radius;
      while(r < viewDist && map.objAtXY(x+r*sin(theta), y-r*cos(theta)) == ' '){
        r += 0.005;
      }
      rays[i][0] = r;
      rays[i][1] = 0;
      if(round((x+r*sin(theta))) == (int)(x+r*sin(theta)) ^ round((y-r*cos(theta))) == (int)(y-r*cos(theta))) rays[i][1] = 1;
    }
    return rays;
  }
  
}
