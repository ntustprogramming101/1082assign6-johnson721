class Cabbage extends Item{
  // Requirement #1: Complete Cabbage Class
  Cabbage(float x,float y){
    isAlive = true;
    this.x = x;
    this.y = y;
  }
  void display(){
    // Display Cabbage
    if(isAlive)image(cabbage, x, y);
  }
  void checkCollision(Player player){
    // Check collision with player
    if(player.health < player.PLAYER_MAX_HEALTH && isAlive
    && isHit(x, y, SOIL_SIZE, SOIL_SIZE, player.x, player.y, player.w, player.h)){
      player.health ++;
      isAlive=false;
    }

  }
}
