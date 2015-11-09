import 'dart:math';
import 'dart:core';

class Tile{
    bool _isComet;
    bool _isWormhole;

    Tile() {
        this._isComet = false;
        this._isWormhole = false;
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

class Player{
    var image;
    num _position;

    Player(num position) {
        this._position = position;
    }

    void move(int steps) {
        num posAwal = this._position;
        num stepAwal = steps;
        this._position+=steps;
        if(this._position>99){
            this._position=99;
            steps = stepAwal - (99 - posAwal);
            moveBackward(steps);
        }
    }

    num getPosition() {
        return this._position;
    }

    void setPosition(int x) {
        this._position = x;
    }

    void moveBackward(int steps) {
    		this._position-=steps;
        if(this._position<0){
            this._position=0;
    }
	
	}
}
class Board{
		List<Tile> _tiles;
    Dice _dice;
    List<Player> _players;
    Random _obstacleRandomizer;
    Set _typeOfObstacles;
    //List<Tile> _obstaclePairs;
    final num _NUM_OF_OBSTACLE = 5;

    Board(int numOfPlayers) {
        this._players = new List<Player>();
        for (int i = 0; i < numOfPlayers; i++) {
            this._players.add(new Player(0));
        }
        this._dice = new Dice();
        this._tiles = new List<Tile>();
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                this._tiles.add(new Tile());
            }
        }
    	this._typeOfObstacles = new Set();
	this._typeOfObstacles.addAll([new Wormhole(), new Comet()]);
        this._obstacleRandomizer = new Random();
        for (int i = 0; i < this._NUM_OF_OBSTACLE; i++) {
            int obstacle = this._obstacleRandomizer.nextInt(2);
            int x = this._obstacleRandomizer.nextInt(100);
            this._typeOfObstacles.elementAt(obstacle).setObstacle(this._tiles.elementAt(x));
        }
    }

    void play() {
        //buat gantian player
        for (int i = 0; i <= this._players.length; i++) {
          	
          if (i == this._players.length) {
                i = 0;
            }
            //print(i.toString());
            Player now = this._players.elementAt(i);
            int steps = this._dice.randomizer();
          	//print("step random "+steps.toString());
            now.move(steps);
            int position = now.getPosition();
          	//print(pos.toString());
          
            if(this._tiles.elementAt(position).isComet()){
                this._typeOfObstacles.elementAt(1).movePlayer(now);
            }
            else if(this._tiles.elementAt(position).isWormhole()){
                this._typeOfObstacles.elementAt(0).movePlayer(now);
            }
          	print("Player"+(i+1).toString());
          	print(now.getPosition());
            	printBoard();
          
            if(now.getPosition()==99){
                break;
            }
        }
    }
    
    void printBoard(){
      StringBuffer sb = new StringBuffer();
      int counter=0;
        for(int i=0;i<this._tiles.length;i++){
          sb.write(this._tiles.elementAt(i).toString());
          counter++;
          if(counter%10==0) sb.writeln();
            }
      print(sb);
      print("\n");
    }
  
  num getPos(num x, num y){
        int positionX = x;
       	int positionY = y;
       	int pos = 0;
        if (positionX>0){
          pos = (((positionX)*10) + (positionY));
        }
        else{
          pos = ((positionX) + (positionY));
        }
        return pos;
      }
}
void main()
{
    Board board = new Board(2);
    board.play();
}
