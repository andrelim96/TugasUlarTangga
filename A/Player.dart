import 'dart:math';
import 'dart:core';
import 'dart:html';

	/// Kelas yang merepresentasikan pemain dalam permainan ular tangga.
class Player{
		/// Atribut yang menyimpan gambar pemain.
    var image;
	
		/// Atribut yang menyimpan posisi pemain dalam papan permainan.
    num _position;

		/// Constructor kelas [Player] dengan parameter [_position].
    Player(num position) {
        this._position = position;
    }

		/// Method untuk memindahkan posisi [Player] sebanyak parameter steps. 
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

		/// Mengembalikan nilai atribut [_position].
    num getPosition() {
        return this._position;
    }

		///Mengeset nilai atribut [_position].
    void setPosition(int x) {
        this._position = x;
    }

		/// Method yang memindahkan posisi [Player] jika sudah melewati papan permainan.
    void moveBackward(int steps) {
    		this._position-=steps;
        if(this._position<0){
            this._position=0;
		}
	}
}
