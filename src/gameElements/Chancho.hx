package gameElements;

import fisica.FisicaSenoidal;

class Chancho extends Npc {

	public function new (anchoPantalla: Int, altoPantalla: Int, tamanio: Float, tiempo: Float, puntos: Int) {
		super(anchoPantalla, altoPantalla, tamanio, puntos, "images/npc_pig.png");

		var posY: Float = (Math.random() + 1) * (altoPantalla / 2 - height);
		var amplitud: Float = altoPantalla - height - posY;
		var posX: Float = -width;
		var velX: Float = 8;
		if (Math.random() < 0.5) {
			velX *= -1;
			posX = anchoPantalla;
		}
		_fisica = new FisicaSenoidal(amplitud, velX, 0.1, posX, posY, tiempo);
		addLives(3);
	}

	override public function getInmunityTime(): Float {
		return 15;
	}

}