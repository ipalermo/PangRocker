package screens;

import flash.text.TextField;
import flash.text.TextFormat;

import gameElements.GameElement;

class Screen extends GameElement {

	private var _screenManager: ScreenManager;

	public function new(sm:ScreenManager) {
		super();
		_screenManager = sm;
	}
	
	public function init(time: Float) { }

	public function end(onComplete:Dynamic){
		onComplete();
	}

	public function getScreenManager(): ScreenManager {
		return _screenManager;
	}

	private function drawText(posx :Float, posy : Float, w :Float, h : Float, color:Int,sprite:TextField, text : String) {
		var tf = new TextFormat(openfl.Assets.getFont('fonts/megadeth-cryptic.ttf').fontName);		
		tf.color = color;
		tf.bold = true;
		tf.align = flash.text.TextFormatAlign.CENTER;
		tf.size = h * 0.8;

		sprite.x = posx;
		sprite.y = posy;
		sprite.width = w;
		sprite.height = h;
		sprite.text = text;
		sprite.setTextFormat(tf);
		addChild(sprite);
	}
}