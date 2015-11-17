class Board{
  List<Tile> _tiles;
  Dice _dice;
  List<Player> _players;
  Random _obstacleRandomizer;
  Set _typeOfObstacles;
  final num _NUM_OF_OBSTACLE = 10;
  int i=-1;
  int x= 0;
  Player now;
  Player next;


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
      int x = this._obstacleRandomizer.nextInt(98)+1;
      this._typeOfObstacles.elementAt(obstacle).setObstacle(this._tiles.elementAt(x));
      if(obstacle ==0)
      {
        querySelector('#b'+(x+1).toString()).text = 'O';
      }
      else if(obstacle ==1)
      {
        querySelector('#b'+(x+1).toString()).text = '*';
      }
    }
  }

  List<Player> getList()
  {
    return _players;
  }
  void setNow(Player player)
  {
    this.now = player;
  }
  void setNext(Player player)
  {
    this.next = player;
  }
  int getX(){
    return this.x;
  }

  void setX(){
    this.x = 1;
  }

  int getI()
  {
    this.i = this.i+1;
    if (i == _players.length) {
      i = 0;
    }
    return this.i;
  }
  void play() {

    int i = this.getI();
    print(i.toString());
    Player now = _players.elementAt(i);
    Player next = null;
    if(i==1) //0
    {
      next =_players.elementAt(0);
    }
    else if(i==0)
    {
      next =_players.elementAt(1);
    }
    int steps = this._dice.randomizer();
    print('#b'+(now.getPosition()+1).toString()); if(next.getPosition()!=now.getPosition()&&now.getPosition()!=99)
      querySelector('#b'+(now.getPosition()+1).toString()).text = (now.getPosition()+1).toString();
    now.move(steps);
    int position = now.getPosition();

    if(this._tiles.elementAt(position).isComet()){
      this._typeOfObstacles.elementAt(1).movePlayer(now);
    }
    else if(this._tiles.elementAt(position).isWormhole()){
      this._typeOfObstacles.elementAt(0).movePlayer(now);
    }
    _tiles.elementAt(now.getPosition()).setHasPlayer();
    print("Player"+(i+1).toString());
    int x= now.getPosition()+1;
    print('#b'+x.toString());
    querySelector('#b'+x.toString()).text = "Player"+(i+1).toString();

    print(now.getPosition());
    printBoard();

    _tiles.elementAt(next.getPosition()).setPlayerLeft();
		if(now.getPosition()==99)
    {
      querySelector('#Rolll').style.cssText = 'display:none';
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
}
