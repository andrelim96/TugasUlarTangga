class Tile{
  bool _hasPlayer;
  bool _isCometEnd;
  bool _isWormholeEnd;
  bool _isSetable;

  Tile() {
    this._hasPlayer = false;
    this._isCometEnd = false;
    this._isWormholeEnd = false;
    this._isSetable = true;
  }
  void setHasPlayer() {
    this._hasPlayer = true;
  }

  void setPlayerLeft() {
    this._hasPlayer = false;
  }

  String toString(){
    if(_hasPlayer) return " + ";
    else return " . ";
  }
  
  bool isCometEnd()
  {
    return this._isCometEnd;
  }
  
  void setCometEnd()
  {
    this._isCometEnd = true;
    this._isSetable = false;
  }
  
  bool isWormholeEnd()
  {
    return this._isWormholeEnd;
  }
  bool isSetable()
  {
    return this._isSetable;
  }
  
  void setWormholeEnd()
  {
    this._isWormholeEnd = true;
    this._isSetable = false;
  }

}
