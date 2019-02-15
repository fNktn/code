class Map{

  String map;
  int seed, w;
  
  Map(int seed){
    this.seed = seed;
    w = 0;
    initMap();
  }

  void initMap(){
    switch(seed){
      case 0:
        w   = 16;
        map = "################"+
              "#              #"+
              "#              #"+
              "#              #"+
              "#              #"+
              "#              #"+
              "#              #"+
              "#              #"+
              "#              #"+
              "#              #"+
              "################";
              
      case 1:
        w   = 16;
        map = "################"+
              "#        #     #"+
              "#        #     #"+
              "#              #"+
              "#        #     #"+
              "###### #########"+
              "#              #"+
              "#              #"+
              "#              #"+
              "#              #"+
              "################";

    
    }
  
  }
  
  char objAtXY(float x, float y){
    int ind = (int)x+(int)y*w;
    if(x <= w && ind <= map.length()) return map.charAt(ind);
    return '?';
  
  }
  

}
