package gameElements;

import flash.display.Sprite;
import flash.display.BitmapData;
import openfl.display.Tilesheet;
import flash.geom.Rectangle;
import flash.geom.Point;


class Animation extends GameElement {

	private var t:Tilesheet;
	private var totalTime:Float;
	private var cant:Int;
	private var _width:Float;
	private var _height:Float;

	public function new (img:BitmapData, cols:Int, rows:Int) {		
		super();
		var col:Int;
		var row:Int;
		_width = Math.round(img.width / cols);
		_height = Math.round(img.height / rows);

		t = new Tilesheet(img);
		for (col in 0 ... cols) {	
			for (row in 0 ... rows) {	
				t.addTileRect(new Rectangle(col * _width, row * _height, _width, _height));
			}
		}
		width = _width;
		height = _height;
		cant = cols * rows;
		t.drawTiles(graphics, [0, 0, 0]);
		totalTime = 0;
	}

	public function getWidth() {
		return _width;
	}

	public function getHeight() {
		return _height;
	}

	override public function updateLogic(time:Float){
		graphics.clear();
		//totalTime +=time;
		var pos:Int=Math.round(time)%cant;	
		t.drawTiles(graphics,[0,0,pos]);
	}

}
