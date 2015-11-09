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

class Player{
    var image;
    num _positionX;
    num _positionY;

    Player(num positionX, num positionY) {
        this._positionX = positionX;
        this._positionY = positionY;
    }

    void move(int steps) {
        num yAwal = this._positionY;
        num stepAwal = steps;
        //print("Awal "+yAwal.toString()+" "+steps.toString()+" "+stepAwal.toString());
      	//print("Dibuletin "+(stepAwal/10).floor().toString());
        for(num i=0;i<(stepAwal/10).floor();i++){
        	this._positionX+=1;
        	steps-=10;
          //print("x sekarang "+_positionX.toString());
        }
      	//print("sisa step "+steps.toString());
        if (9 - _positionY >= steps) {
            this._positionY = this._positionY + steps;
        } else {
            steps = steps - (9 - this._positionY);
            this._positionX = this._positionX + 1;
            this._positionY = steps-1;
        }
        if(this._positionX>9){
            this._positionX=9;
            steps = stepAwal - (9 - yAwal);
            this._positionY=9;
            moveBackward(steps);
        }
    }

    num getPositionX() {
        return this._positionX;
    }

    num getPositionY() {
        return this._positionY;
    }

    void setPosition(int x, int y) {
        this._positionX = x;
        this._positionY = y;
    }

    void moveBackward(int steps) {
    		int yAwal = this._positionY;
        int stepAwal = steps;
    		for(int i=0;i<(stepAwal/10).floor();i++)
        {
        	this._positionX-=1;
        	steps-=10;
        }
        if (this._positionY - steps >= 0) {
            this._positionY = this._positionY - steps;
        } else {
            steps = steps - this._positionY;
            this._positionX = this._positionX - 1;
            this._positionY = 9 - steps +1;
        }
    }
  	String getStat()
    {
      return this._positionX.toString()+" "+this._positionY.toString();
    }
	
}

class Board{
		List<Tile> _tiles;
    Dice _dice;
    List<Player> _players;
    Random _obstacleRandomizer;
    Set _typeOfObstacles;
    List<Tile> _obstaclePairs;
    final num _NUM_OF_OBSTACLE = 5;

    Board(int numOfPlayers) {
        this._players = new List<Player>();
        for (int i = 0; i < numOfPlayers; i++) {
            this._players.add(new Player(0,0));
        }
        this._dice = new Dice();
        this._tiles = new List<Tile>();
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                this._tiles.add(new Tile(i, j));
            }
        }
    	this._typeOfObstacles = new Set();
	this._typeOfObstacles.addAll([new Wormhole(), new Comet()]);
        this._obstacleRandomizer = new Random();
        int j=-1;
        for (int i = 0; i < this._NUM_OF_OBSTACLE; i++) {
            int obstacle = this._obstacleRandomizer.nextInt(2);
            int x = this._obstacleRandomizer.nextInt(10);
            int y = this._obstacleRandomizer.nextInt(10);
            this._typeOfObstacles.elementAt(obstacle).setObstacle(this._tiles.elementAt(this.getPos(x,y)));
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
            int positionX = now.getPositionX();
            int positionY = now.getPositionY();
          	int pos = this.getPos(positionX, positionY);
          	//print(pos.toString());
          
            if(this._tiles.elementAt(pos).isComet()){
                this._typeOfObstacles.elementAt(1).movePlayer(now);
            }
            else if(this._tiles.elementAt(pos).isWormhole()){
                this._typeOfObstacles.elementAt(0).movePlayer(now);
            }
            if(now.getPositionX()==9&&now.getPositionY()==9){
                break;
            }
          	print("Player"+(i+1).toString());
          	print(now.getStat());
            	printBoard();
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
