import 'dart:math';
import 'dart:core';
import 'dart:html';

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
	
		/// Set yang menyimpan [Obstacle].
    Set _typeOfObstacles;
	
		/// Atribut yang menyimpan banyaknya [Obstacle] dalam [Board].
    final num _NUM_OF_OBSTACLE = 5;
		
		/// Atribut yang menyimpan giliran [Player]
	int _giliranPemain=-1;

		/// True jika [Player] bermain melawan komputer.
	boolean _playingWithComp;
 		
		/// [Player] yang sedang bermain. 
  	Player _now;
	
		///[Player] yang bermain selanjutnya.
  	Player _next;
  	

		/// Constructor kelas [Board] dengan parameter banyaknya pemain.
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

		/// Method untuk mendapatkan seluruh pemain [_players].
  	List<Player> getList(){
		return _players;
    }
		/// Method yang mengeset pemain [Player] mana yang sedang bermain.
	void setNow(Player player){
		this.now = player;
    }
		/// Method yang mengeset pemain [Player] mana yang selanjutnya bermain.
  	void setNext(Player player){
		this.next = player;
    }
		/// Method untuk mengeset jika [Player] bermain melawan komputer.
	bool setPlayWithComp(){
		this.playingWithComp = true;
	}
	
		/// Method yang mengembalikan nilai atribut [playingWithComp].
	int getGiliranPemain(){
		this.giliranPemain = this.giliranPemain+1;
		if (giliranPemain == _players.length) {
			giliranPemain = 0;
		}
		return this.giliranPemain;
	}
	
	
		/// Method yang merepresentasikan jalannya permainan ular tangga.
	void play() {

		int i = this.getGiliranPemain();
		print(i.toString());
		Player now = _players.elementAt(i);
		Player next = null;
		if(i==1) //0{
			next =_players.elementAt(0);
		}
		else if(i==0){
			next =_players.elementAt(1);
		}
		int steps = this._dice.randomizer();
		print('#b'+(now.getPosition()+1).toString());
		if(next.getPosition()!=now.getPosition()&&now.getPosition()!=99)
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
		if(now.getPosition()==99){
			querySelector('#Rolll').style.cssText = 'display:none';
		}

		if(this._playingWithComp){
			this.playWithComp();
		}
	}
    
	
		/// Method yang merepresentasikan giliran main komputer.
	void playWithComp() {
		int i = this.getGiliranPemain();
		print(i.toString());
		Player now = _players.elementAt(i);
		Player next = null;
		if(i==1) //0{
			next =_players.elementAt(0);
		}
		else if(i==0){
			next =_players.elementAt(1);
		}
		int steps = this._dice.randomizer();
		print('#b'+(now.getPosition()+1).toString());
		if(next.getPosition()!=now.getPosition()&&now.getPosition()!=99)
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
		if(now.getPosition()==99){
			querySelector('#Rolll').style.cssText = 'display:none';
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
  	Board board = new Board(2);
    InputElement roll = querySelector('#Rolll');
    roll.onClick.listen((event) => board.play());
}
