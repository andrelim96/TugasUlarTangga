///Kelas yang merepresentasikan sebuah petak dalam papan permainan ular tangga.
class Tile{
  ///atribut yang menyimpan nilai boolean apakah pada petak terdapat pemain.
  bool _hasPlayer;
  ///atribut yang menyimpan nilai boolean apakah petak merupakan bagian ujung komet.
  bool _isCometEnd;
  ///atribut yang menyimpan nilai boolean apakah petak merupakan bagian ujung wormhole.
  bool _isWormholeEnd;
  ///atribut yang menyimpan nilai boolean apakah petak dapat di set menjadi obstacle.
  bool _isSetable;
  
  ///Constructor kelas Tile.
  Tile() {
    this._hasPlayer = false;
    this._isCometEnd = false;
    this._isWormholeEnd = false;
    this._isSetable = true;
  }
  ///Method untuk megubah nilai atribut _hasPlayer menjadi true.
  void setHasPlayer() {
    this._hasPlayer = true;
  }
  ///Method untuk megubah nilai atribut _hasPlayer menjadi false.
  void setPlayerLeft() {
    this._hasPlayer = false;
  }
  ///Method untuk merepresentasikan petak dalam text mode.
  String toString(){
    if(_hasPlayer) return " + ";
    else return " . ";
  }
  
  ///Method yang mengembalikan nilai boolean apakan petak merupakan bagian ujung komet.
  bool isCometEnd()
  {
    return this._isCometEnd;
  }
  ///Method untuk mengubah nilai atribut _isCometEnd menjadi true dan _isSetable menjadi false.
  void setCometEnd()
  {
    this._isCometEnd = true;
    this._isSetable = false;
  }
  ///Method yang mengembalikan nilai boolean apakan petak merupakan bagian ujung woemhole.
  bool isWormholeEnd()
  {
    return this._isWormholeEnd;
  }
  ///Method untuk mengubah nilai atribut _isWormholeEnd menjadi true dan _isSetable menjadi false.
  void setWormholeEnd()
  {
    this._isWormholeEnd = true;
    this._isSetable = false;
  }
  
  //Method yang mengembalikan nilai boolean apakah petak dapat diset menjadi obstacle.
  bool isSetable()
  {
    return this._isSetable;
  }

}
