
import 'dart:math';
import 'dart:core';

class Wormhole extends Obstacle{
	//@Override
    void setObstacle(Tile tile){
  	tile.setAsWormhole();    
  }

    //@Override
    void movePlayer(Player player) {
        Random rnd = new Random();
        int steps = rnd.nextInt(30)+1;
        player.moveBackward(steps);
    }
}
