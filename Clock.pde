class Clock extends Item{
  // Requirement #2: Complete Clock Class
  Clock(float x,float y){
    isAlive = true;
    this.x = x;
    this.y = y;
  }
  void display(){
    //  Display Clock
    if(isAlive)image(clock, x, y);
  }
  void checkCollision(Player player){
    // Check collision with player
    if( isAlive &&
      isHit(x, y, SOIL_SIZE, SOIL_SIZE, player.x, player.y, player.w, player.h)){
      addTime(CLOCK_BONUS_SECONDS);
      isAlive=false;
    }

  }
}
