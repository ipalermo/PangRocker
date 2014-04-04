package gameElements;

import flash.display.DisplayObject;
import flash.display.Sprite;

class GameElement extends Sprite {

	private var logicalChild:Array<GameElement>;

	public function new () {
		super();
		logicalChild=new Array<GameElement>();
	}

	public function updateLogic(time:Float) {
		for (hijo in logicalChild) {
			hijo.updateLogic(time);
		}
	}

	public function setSize(height: Float) {
		this.scaleX = this.scaleY = 1;
		var proporcion: Float = height/this.height;
		this.scaleX = this.scaleY = proporcion;
		
	}

	public function addLogicalChild(child : GameElement) {
		logicalChild.push(child);
	}
}