final int res = 30;
final int scl = 3;
final int viewDist = 20;

float t;


Player player;
Map    map;


void settings(){
  size((res*16)*scl, (res*9)*scl);
}

void setup(){
  player = new Player(2,2,PI/2,PI/3);
  map    = new Map(0);
  t = 0;
}

void draw(){
  float[][] rays = player.castRays(map);
  background(0);
  loadPixels();
  
  //ceiling
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height/2; j++){
      pixels[i+width*j] = color(map(j,0,height/2,50,150),map(j,height/2,height,50,150),200);
    }
  }
  
  //floor
  for(int i = 0; i < width; i++){
    for(int j = height/2; j < height; j++){
      pixels[i+width*j] = color(map(j*j,height/2*height/2,height*height,30,150));
    }
  }
  
  //walls
  for(int x = 0; x < res*16; x++){
    float h = res*scl*4 / rays[x][0];
    h = h < height/2 ? h : height/2 - 1 ;
    for(int j = 0; j < scl; j++){
      for(int y = 0; y <= h; y++){
        color c = rays[x][1] == 0 ? color(map(h,height/2,0,255,100)) : color(map(h,height/2,0,180,50));
        pixels[x*scl+j+(height/2+y)*width] = c;
        pixels[x*scl+j+(height/2-y)*width] = c;
      }
    }
  }
  updatePixels();
  
  text("W A S D to move \nLEFT and RIGHT to look around", 20, 20);
  
  
  t += 0.1;
  
}

void keyPressed(){
  if(key == 'w') player.walk(0.1);
  if(key == 's') player.walk(-0.1);
  if(key == 'd') player.strafe(0.1);
  if(key == 'a') player.strafe(-0.1);
  if(keyCode == RIGHT) player.turn(0.06);
  if(keyCode == LEFT) player.turn(-0.06);
}
