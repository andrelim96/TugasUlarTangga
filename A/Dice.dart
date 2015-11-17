import 'dart:math';
import 'dart:core';
import 'dart:html';

/// Kelas yang merepresentasikan dadu dalam permainan ular tangga.
class Dice{

		/// Atribut untuk merandom angka dadu. 
	Random random;
  
		/// Constructor kelas [Dice].
	Dice(){
		random = new Random();
	}
	
		/// Mengeluarkan angka dadu hasil random.
	num randomizer(){
		return random.nextInt(12)+1;
	}
}
