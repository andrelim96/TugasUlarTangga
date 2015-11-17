import 'dart:math';
import 'dart:core';
import 'dart:html';

	///Kelas ini merepresentasikan petak yang ada pada [Board].
class Tile{

		/// True jika petak adalah komet.
    bool _isComet;
	
		/// True jika petak adalah wormhole.
    bool _isWormhole;
  	
		/// True jika ada pemain di dalam petak.
	bool _hasPlayer;

		/// Constructor kelas [Tile].
    Tile() {
        this._isComet = false;
        this._isWormhole = false;
    }
	
		/// Mengembalikan nilai atribut [_isComet].
    bool isComet() {
        return this._isComet;
    }

		/// Mengembalikan nilai atribut [_isWormhole].
    bool isWormhole() {
        return this._isWormhole;
    }

		/// Mengeset petak menjadi wormhole.
    void setAsWormhole() {
        this._isWormhole = true;
    }

		/// Mengeset petak menjadi komet.
    void setAsComet() {
        this._isComet = true;
    }
	
		/// Mengeset nilai atribut [_hasPlayer] menjadi true.
  	void setHasPlayer() {
        this._hasPlayer = true;
    }
    
		/// Method yang merepresentasikan pemain meninggalkan permainan. 
		/// Mengeset nilai atribut [_hasPlayer] menjadi false.
	void setPlayerLeft() {
        this._hasPlayer = false;
    }
  
		/// Method yang mengembalikan tampilan petak dalam text mode.
    String toString(){
        if(_isComet) return " * ";
        else if(_isWormhole) return " O ";
        else if(_hasPlayer) return " + ";
        else return " . ";
    }
}
