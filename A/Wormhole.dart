import 'dart:math';
import 'dart:core';
import 'dart:html';

	/// Kelas turunan [Obstacle] yang merepresentasikan Wormhole.
class Wormhole extends Obstacle{
	
		//@Override
		/// Method untuk mengeset [Tile] menjadi halangan.
    void setObstacle(Tile tile){
		tile.setAsWormhole();    
	}

		//@Override
		/// Method untuk memindahkan [Player] yang terkena halangan.
    void movePlayer(Player player) {
        Random rnd = new Random();
        int steps = rnd.nextInt(30)+1;
        player.moveBackward(steps);
    }
}
