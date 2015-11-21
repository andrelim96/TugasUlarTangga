///Kelas abstrak yang merepresentasikan rintangan dalam papan permainan ular tangga.
abstract class  Obstacle extends Tile{
  ///atribut yang menyimpan index letak awal rintangan dalam papan permainan.
  int _in;
   ///atribut yang menyimpan index letak akhir rintangan dalam papan permainan.
  int _out;
  Random random = new Random();
  
  ///Method yang mengembalikan index letak akhir rintangan dalam papan permainan.
  int getOutIndex()
  {
    return this._out;
  }
  
  ///Method yang mengembalikan index letak akhir rintangan dalam papan permainan.
   int getInIndex()
  {
    return this._in;
  }
  ///Method yang mengubah nilai index letak akhir rintangan dalam papan permainan dengan parameter nilai pengganti index letak akhir.
  void setOutIndex(int x)
  {
    this._out=x;
  }
  ///Method yang mengubah nilai index letak awal rintangan dalam papan permainan dengan parameter nilai pengganti index letak awal.
   void setInIndex(int x)
  {
    this._in = x;
  }

}
