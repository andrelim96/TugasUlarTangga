import 'dart:math';
import 'dart:core';
import 'dart:html';

/// Kelas turunan [Obstacle] yang merepresentasikan komet.
class Comet extends Obstacle{
  Comet(int x)
  {
    	this._isSetable = false;
    	this._in = x;
    	this._out = x + random.nextInt(16);
    	if(this._out>98) this._out = 98;
  }

  //@Override
  /// Method untuk memindahkan [Player] yang terkena halangan.
  void movePlayer(Player player) {
    player.move(this._out-this._in);
  }
   String toString(){
    if(_hasPlayer) return " + ";
    else return " * ";
  }
}
