abstract class  Obstacle extends Tile{
  int _in;
  int _out;
  Random random = new Random();
  
  int getOutIndex()
  {
    return this._out;
  }
  
   int getInIndex()
  {
    return this._in;
  }
  void setOutIndex(int x)
  {
    this._out=x;
  }
  
   void setInIndex(int x)
  {
    this._in = x;
  }

}
