class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class
  float speed = 1f,currentSpeed;
	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  int currentXir=1;
  boolean checkXX=false,checkXY=false;
  Dinosaur(float x, float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    pushMatrix();
    if(currentXir==-1){
      scale(-1,1);
      image(dinosaur, -x-dinosaur.width, y);
    }else{
      image(dinosaur, x, y);
    }
    popMatrix();
  }
  void update(Player player){
    checkXX=(currentXir==1&&player.x+player.w>x)||(currentXir==-1&&player.x+player.w<x);
    checkXY=y==player.y;
    if(checkXX&&checkXY)currentSpeed=TRIGGERED_SPEED_MULTIPLIER;
    else currentSpeed=speed;
    if(x + currentSpeed*currentXir<0 || x + currentSpeed*currentXir + dinosaur.width >= width){
      currentXir=-currentXir;
    }
      x += currentSpeed*currentXir;
    }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
