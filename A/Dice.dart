import 'dart:math';
import 'dart:core';

class Dice{
	Random random;
  
  Dice(){
  	random = new Random();
  }
  
  num randomizer(){
  	return random.nextInt(12)+1;
  }
}

abstract class  Obstacle{
  var image;
  
	void setObstacle(Tile tile);
  void movePlayer(Player player);
  
}
