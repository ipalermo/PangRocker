package gameElements;

import flash.display.Bitmap;
import openfl.Assets;

class Image extends GameElement {

	private var _bitmap: Bitmap;

	public function new(path: String, tamanio: Float) {
		super();
		_bitmap = new Bitmap (Assets.getBitmapData (path));
		addChild(_bitmap);
		setSize(tamanio);
	}

}