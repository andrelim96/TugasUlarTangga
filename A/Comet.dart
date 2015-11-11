import 'dart:math';
import 'dart:core';

class Comet extends Obstacle{
	//@Override
    void setObstacle(Tile tile) {
        tile.setAsComet();
    }

    void movePlayer(Player player) {
        Random rnd = new Random();
        int steps = rnd.nextInt(30)+1;
        player.move(steps);
    }
}
