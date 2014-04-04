package gameElements;

import fisica.Fisica;
import fisica.FisicaGravitacional;

class BackgroundMenu extends Image {

	private var _fisica: Fisica;

	public function new(path: String, tamanio: Float) {
		super(path, tamanio);
		_fisica = new FisicaGravitacional(-0.1, 10, 0, 0, 0, 0);
	}

	override public function updateLogic(time:Float) {
		super.updateLogic(time);
		x = _fisica.getX(time);
		y = _fisica.getY(time);
		if (x > 0) {
			_fisica.moverHaciaIzquierda();
		}
		else
			if (x < -width/2) {
				_fisica.moverHaciaDerecha();
			}
		if (y > 0) {
			_fisica.moverHaciaArriba();
		}
		else
			if (y < -height/2) {
				_fisica.moverHaciaAbajo();
			}
	}

}