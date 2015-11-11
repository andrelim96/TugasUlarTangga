import 'dart:math';
import 'dart:core';

abstract class  Obstacle{
  var image;
  
	void setObstacle(Tile tile);
  void movePlayer(Player player);
  
}
