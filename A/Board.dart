import 'dart:math';
import 'dart:core';
import 'dart:html';
import 'dart:async';

/// Kelas yang merepresentasikan papan permainan ular tangga.
class Board{

/// List dari semua [Tile] yang ada pada [Board]. 
  List<Tile> _tiles;
/// Dadu [Dice] yang digunakan dalam permainan.
  Dice _dice;
  /// List dari pemain [Player] yang sedang bermain.
  List<Player> _players;
  /// Atribut untuk merandom posisi [Obstacle] pada [Board].
  Random _obstacleRandomizer;
  /// Atribut yang menyimpan banyaknya [Obstacle] dalam [Board].
  final num _NUM_OF_OBSTACLE = 10;
  /// Atribut yang menyimpan giliran [Player]
  int _giliranPemain=-1;
  ///Atribut yang menyimpan nilai boolean apakah board memiliki player computer
  bool _playingWithComp;

  /// Constructor kelas [Board] dengan parameter banyaknya pemain.
   Board(int numOfPlayers, bool withComp) {
    querySelector('#Comp').style.cssText = 'display:none';
     querySelector('#Player').style.cssText = 'display:none';
    this._playingWithComp = withComp;
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
    this._obstacleRandomizer = new Random();
    for (int i = 0; i < this._NUM_OF_OBSTACLE; i++) {
      int obstacle = this._obstacleRandomizer.nextInt(2);
      print(obstacle.toString());
      int x = this._obstacleRandomizer.nextInt(95)+2;
      if(obstacle ==0)
      {
        while(!_tiles.elementAt(x).isSetable())
        {
          x = this._obstacleRandomizer.nextInt(95)+2;
        }
        Wormhole temp = new Wormhole(x);
        _tiles.removeAt(x);
        _tiles.insert(x,temp);
        while(!_tiles.elementAt(temp.getOutIndex()).isSetable())
        {
          temp.setOutIndex(temp.getOutIndex()+1);
        }
           _tiles.elementAt(temp.getOutIndex()).setWormholeEnd();
        print((x+1).toString());
        print((temp.getOutIndex()+1).toString());
        querySelector('#b'+(x+1).toString()).style.backgroundImage = "url('http://i.imgur.com/eSaaclS.gif')";
        querySelector('#b'+(temp.getOutIndex()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/YGWtlBR.gif')";
      }
      else if(obstacle ==1)
      {
        while(!_tiles.elementAt(x).isSetable())
        {
          x = this._obstacleRandomizer.nextInt(95)+2;
        }
        Comet temp = new Comet(x);
        _tiles.removeAt(x);
        _tiles.insert(x,temp);
         while(!_tiles.elementAt(temp.getOutIndex()).isSetable())
        {
          temp.setOutIndex(temp.getOutIndex()+1);
        }
        _tiles.elementAt(temp.getOutIndex()).setCometEnd();
        print((x+1).toString());
        print((temp.getOutIndex()+1).toString());
        querySelector('#b'+(x+1).toString()).style.backgroundImage = "url('http://i.imgur.com/jo90VY4.gif')";
         querySelector('#b'+(temp.getOutIndex()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/RIBOFxo.gif')";
      }
      
    }
  }
  /// Method untuk mendapatkan seluruh pemain [_players].
  List<Player> getList()
  {
    return _players;
  }

  /// Method yang mengembalikan nilai untuk menentukan pemain, 0 untuk Player1 dan 1 untuk Player2.
	int getGiliranPemain(){
		this._giliranPemain = this._giliranPemain+1;
		if (_giliranPemain == _players.length) {
			_giliranPemain = 0;
		}
		return this._giliranPemain;
	}

  /// Method yang merepresentasikan jalannya permainan ular tangga.
  void play() {

    int i = this.getGiliranPemain();
    //print(i.toString());
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
    if(steps == 1){
			querySelector('#img').style.background = "src =  url('http://i.imgur.com/yVeTbl7.png')";
		}
		else if(steps == 2){
		querySelector('#img').style.background = "http://i.imgur.com/wb4raPk.png')";
		}
		else if(steps == 3){
		querySelector('#img').style.background = "url('http://i.imgur.com/w6UtvOd.png')";
		}
		else if(steps == 4){
		querySelector('#img').style.background = "url('http://i.imgur.com/yXSX8o2.png')";
		}
		else if(steps == 5){
		querySelector('#img').style.background = "url('http://i.imgur.com/Q1mIluA.png')";
		}
		else if (steps == 6){
		querySelector('#img').style.background = "url('http://i.imgur.com/EgRIZwJ.png')";
		}
    print(steps.toString());
    //print('#b'+(now.getPosition()+1).toString()); 
   if(next.getPosition()!=now.getPosition()&&now.getPosition()!=99)
    {
        if(_tiles.elementAt(now.getPosition()) is Comet)
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/jo90VY4.gif')";
        }
       if(_tiles.elementAt(now.getPosition()).isCometEnd() )
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/RIBOFxo.gif')";
        }
       if(_tiles.elementAt(now.getPosition()) is Wormhole)
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/eSaaclS.gif')";
        }
       if(_tiles.elementAt(now.getPosition()).isWormholeEnd() )
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/YGWtlBR.gif')";
        }
      else
      {
        querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('')";
      }
      
    }
    now.move(steps);
    int position = now.getPosition();

    if(this._tiles.elementAt(position) is Comet){
      Comet x = this._tiles.elementAt(position);
      x..movePlayer(now);
    }
    else if(this._tiles.elementAt(position) is Wormhole){
      Wormhole x = this._tiles.elementAt(position);
      x..movePlayer(now);
    }
    _tiles.elementAt(now.getPosition()).setHasPlayer();
    //print("Player"+(i+1).toString());
    int x= now.getPosition()+1;
    //print('#b'+x.toString());
    if(i==0)
    {
      querySelector('#b'+x.toString()).style.backgroundImage = "url('http://i.imgur.com/Y3r30hN.png')";
    }
    else if(i==1)
    {
      querySelector('#b'+x.toString()).style.backgroundImage = "url('http://i.imgur.com/b8o7YWP.png')";
      
    }
    //print(now.getPosition());
   // printBoard();

    _tiles.elementAt(next.getPosition()).setPlayerLeft();
		if(now.getPosition()==99)
    {
      querySelector('#Roll').style.cssText = 'display:none';
    }
    if(this._playingWithComp){
			sleep();
		}
  }

  ///Method untuk memberi jeda antara giliran jalan player dan giliran jalan computer	
  Future sleep() {
  return new Future.delayed(const Duration(seconds: 1), () => playWithComp());
}
  /// Method yang merepresentasikan giliran main player komputer.
  void playWithComp() {

    int i = this.getGiliranPemain();
    //print(i.toString());
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
    if(steps == 1){
			querySelector('#img').style.background = "src =  url('http://i.imgur.com/yVeTbl7.png')";
		}
		else if(steps == 2){
		querySelector('#img').style.background = "url('http://i.imgur.com/wb4raPk.png')";
		}
		else if(steps == 3){
		querySelector('#img').style.background = "url('http://i.imgur.com/w6UtvOd.png')";
		}
		else if(steps == 4){
		querySelector('#img').style.background = "url('http://i.imgur.com/yXSX8o2.png')";
		}
		else if(steps == 5){
		querySelector('#img').style.background = "url('http://i.imgur.com/Q1mIluA.png')";
		}
		else if (steps == 6){
		querySelector('#img').style.background = "url(' http://i.imgur.com/EgRIZwJ.png')";
		}
    print(steps.toString());
    //print('#b'+(now.getPosition()+1).toString()); 
    if(next.getPosition()!=now.getPosition()&&now.getPosition()!=99)
    {
        if(_tiles.elementAt(now.getPosition()) is Comet)
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/jo90VY4.gif')";
        }
       if(_tiles.elementAt(now.getPosition()).isCometEnd() )
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/RIBOFxo.gif')";
        }
       if(_tiles.elementAt(now.getPosition()) is Wormhole)
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/eSaaclS.gif')";
        }
       if(_tiles.elementAt(now.getPosition()).isWormholeEnd() )
        {
          querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('http://i.imgur.com/YGWtlBR.gif')";
        }
      else
      {
        querySelector('#b'+(now.getPosition()+1).toString()).style.backgroundImage = "url('')";
      }
      
    }
    now.move(steps);
    int position = now.getPosition();

    if(this._tiles.elementAt(position) is Comet){
      Comet x = this._tiles.elementAt(position);
      x..movePlayer(now);
    }
    else if(this._tiles.elementAt(position) is Wormhole){
      Wormhole x = this._tiles.elementAt(position);
      x..movePlayer(now);
    }
    _tiles.elementAt(now.getPosition()).setHasPlayer();
    //print("Player"+(i+1).toString());
    int x= now.getPosition()+1;
    //print('#b'+x.toString());
    if(i==0)
    {
      querySelector('#b'+x.toString()).style.backgroundImage = "url('http://i.imgur.com/Y3r30hN.png')";
    }
    else if(i==1)
    {
      querySelector('#b'+x.toString()).style.backgroundImage = "url('http://i.imgur.com/b8o7YWP.png')";
      
    }
    //print(now.getPosition());
   // printBoard();

    _tiles.elementAt(next.getPosition()).setPlayerLeft();
		if(now.getPosition()==99)
    {
      querySelector('#Roll').style.cssText = 'display:none';
    }
  }
  /// Method untuk menampilkan [Board] dalam text mode.
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
	/// Method untuk menjalankan permainan.
void main(){
  Board board = null;
  InputElement comp = querySelector('#Comp');
    comp.onClick.listen((event) => board = new Board(2,true));
  InputElement player = querySelector('#Player');
    player.onClick.listen((event) => board = new Board(2,false));
    InputElement roll = querySelector('#Roll');
    roll.onClick.listen((event) => board.play());
}
