import 'dart:math';
import 'dart:core';
import 'dart:html';

/// Kelas turunan [Obstacle] yang merepresentasikan Wormhole.
class Wormhole extends Obstacle{
  Wormhole(int x)
  {
    	this._isSetable = false;
    	this._in = x;
    	this._out = x - random.nextInt(16);
    	if(this._out<0) this._out = 0;
  }

  //@Override
  /// Method untuk memindahkan [Player] yang terkena halangan.
  void movePlayer(Player player) {
    player.moveBackward(this._in - this._out);
  }
   String toString(){
    if(_hasPlayer) return " + ";
    else return " O ";
  }
}
