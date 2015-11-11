import 'dart:math';
import 'dart:core';

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
