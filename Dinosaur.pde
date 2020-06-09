class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class
  float speed = 1f,currentSpeed;
	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  Dinosaur(float x, float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    image(dinosaur, x, y);
  }
  void update(Player player){
    if(y==player.y && x<player.x)currentSpeed=TRIGGERED_SPEED_MULTIPLIER;
    else currentSpeed=speed;
    x += currentSpeed;
    if(x >= width) x = -w;
  }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
