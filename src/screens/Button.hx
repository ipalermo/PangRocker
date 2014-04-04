package screens;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;

class Button extends Sprite {

	private var _texto: TextField;

	public function new (w:Int, h:Int, color:Int, onClick: Dynamic, labelText:String) {
		super();

//		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, w, h);
		this.graphics.endFill();
		this.addEventListener(MouseEvent.CLICK, onClick);

		var tf = new TextFormat(openfl.Assets.getFont('fonts/megadeth-cryptic.ttf').fontName);
		tf.size = h * 0.8;
		tf.color = color;
		tf.bold = true;
		tf.align = flash.text.TextFormatAlign.CENTER;

		this._texto = new TextField();
		this._texto.width = w;
		this._texto.height = h;
		this._texto.text = labelText;
		this._texto.setTextFormat(tf);
		this._texto.y = (h - _texto.textHeight);
		this.addChild(_texto);
	}

}