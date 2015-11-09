import 'dart:math';
import 'dart:core';

class Tile{
		num _x;
    num _y;
    bool _isComet;
    bool _isWormhole;

    Tile(num x, num y) {
        this._x = x;
        this._y = y;
        this._isComet = false;
        this._isWormhole = false;
    }

    num getX() {
        return this._x;
    }

    num getY() {
        return this._y;
    }

    void setX(int x) {
        this._x = x;
    }

    void setY(int y) {
        this._y = y;
    }

    bool isComet() {
        return this._isComet;
    }

    bool isWormhole() {
        return this._isWormhole;
    }

    void setAsWormhole() {
        this._isWormhole = true;
    }

    void setAsComet() {
        this._isComet = true;
    }

    String toString(){
        if(_isComet) return " * ";
        else if(_isWormhole) return " O ";
        else return " . ";
    }

}

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
