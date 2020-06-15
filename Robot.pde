class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class
	final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f,currentSpeed;
  int currentDir=1;
  Laser laser=new Laser();
  int laserCount=0;
  boolean checkX=false,checkY=false;
  Robot(float x, float y){
    super(x, y);
  }
  void display(){
    laser.display();
    pushMatrix();
    if(currentDir==-1){
      scale(-1,1);
      image(robot, -x-robot.width, y);
    }else{
      image(robot, x, y);
    }
    popMatrix();
  }
  void update(Player player){
    laser.update();
    laserCount++;
    checkX=(currentDir==1&&player.x+player.w>x)||(currentDir==-1&&player.x+player.w<x);
    checkY=y<=player.y+PLAYER_DETECT_RANGE_ROW*SOIL_SIZE && y>=player.y-PLAYER_DETECT_RANGE_ROW*SOIL_SIZE;
    if(checkX&&checkY){
      currentSpeed=0;
      if (laserCount>=LASER_COOLDOWN) {
        if(currentDir==1)laser.fire(x+HAND_OFFSET_X_FORWARD,y+HAND_OFFSET_Y,player.x+player.w/2,player.y+player.h/2);
        else laser.fire(x+HAND_OFFSET_X_BACKWARD,y+HAND_OFFSET_Y,player.x+player.w/2,player.y+player.h/2);
        laserCount=0;
      }
    }
    else{
      currentSpeed=speed;
    }
    if(x + currentSpeed*currentDir<0 || x + currentSpeed*currentDir + robot.width >= width){
      currentDir=-currentDir;
    }
    x += currentSpeed*currentDir;
  }
  void checkCollision(Player player){
    laser.checkCollision(player);
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
      player.hurt();

    }
  }
	// HINT: Player Detection in update()
	/*
	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )
	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me
	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}
	*/
}
