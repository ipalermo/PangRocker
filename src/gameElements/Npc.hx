package gameElements;

import flash.display.Bitmap;
import flash.geom.Point;
import openfl.Assets;
import fisica.Fisica;
import screens.GamePlayScreen;

class Npc extends Personaje {

	private var _anchoPantalla: Int;
	private var _altoPantalla: Int;
	private var _fisica: Fisica;

	public function new (anchoPantalla: Int, altoPantalla: Int, tamanio: Float, puntos: Int, pathImagen: String) {
		super(puntos);
		this.addChild(new Image(pathImagen, tamanio));
		_anchoPantalla = anchoPantalla;
		_altoPantalla = altoPantalla;
		this.boundingBox = new Point(this.width, this.height);
	}

	override public function updateLogic(time:Float) {
		super.updateLogic(time);
		x = _fisica.getX(time);
		y = _fisica.getY(time);
		if (y < 0) {
			_fisica.moverHaciaAbajo();
		} else if (y + height > _altoPantalla) {
			_fisica.moverHaciaArriba();
		}
		if (x < 0) {
			_fisica.moverHaciaDerecha();
		} else if (x + width > _anchoPantalla) {
			_fisica.moverHaciaIzquierda();
		}
	}


}