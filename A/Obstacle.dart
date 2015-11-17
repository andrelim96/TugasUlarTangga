import 'dart:math';
import 'dart:core';
import 'dart:html';

	/// Kelas abstrak untuk merepresentasikan halangan yang ada dalam permainan ular tangga.
abstract class  Obstacle{
		/// Atribut yang menyimpan gambar halangan.
	var image;
	
		/// Method untuk mengeset [Tile] menjadi halangan.
	void setObstacle(Tile tile);
	
		/// Method untuk memindahkan [Player] yang terkena halangan.
	void movePlayer(Player player);
}
