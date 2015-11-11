import 'dart:math';
import 'dart:core';

class Player{
		var image;
    num _positionX;
    num _positionY;

    Player(num positionX, num positionY) {
        this._positionX = positionX;
        this._positionY = positionY;
    }

    void move(int steps) {
        num yAwal = this._positionY;
        num stepAwal = steps;
        //print("Awal "+yAwal.toString()+" "+steps.toString()+" "+stepAwal.toString());
      	//print("Dibuletin "+(stepAwal/10).floor().toString());
        for(num i=0;i<(stepAwal/10).floor();i++){
        	this._positionX+=1;
        	steps-=10;
          //print("x sekarang "+_positionX.toString());
        }
      	//print("sisa step "+steps.toString());
        if (9 - _positionY >= steps) {
            this._positionY = this._positionY + steps;
        } else {
            steps = steps - (9 - this._positionY);
            this._positionX = this._positionX + 1;
            this._positionY = steps-1;
        }
        if(this._positionX>9){
            this._positionX=9;
            steps = stepAwal - (9 - yAwal);
            this._positionY=9;
            moveBackward(steps);
        }
    }

    num getPositionX() {
        return this._positionX;
    }

    num getPositionY() {
        return this._positionY;
    }

    void setPosition(int x, int y) {
        this._positionX = x;
        this._positionY = y;
    }

    void moveBackward(int steps) {
    		int yAwal = this._positionY;
        int stepAwal = steps;
    		for(int i=0;i<(stepAwal/10).floor();i++)
        {
        	this._positionX-=1;
        	steps-=10;
        }
        if (this._positionY - steps >= 0) {
            this._positionY = this._positionY - steps;
        } else {
            steps = steps - this._positionY;
            this._positionX = this._positionX - 1;
            this._positionY = 9 - steps +1;
        }
    }
  	String getStat()
    {
      return this._positionX.toString()+" "+this._positionY.toString();
    }
	
}
