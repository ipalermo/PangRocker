package gameElements;

import fisica.FisicaGravitacional;
import screens.GamePlayScreen;

class Pelota extends Npc {

	private static var _VELOCIDAD_MAX: Float = 50;
	private static var _VELOCIDAD_MIN: Float = 5;
	private static var _ANGULO_MAX: Float = Math.PI * 3 / 2;

	public function new (anchoPantalla: Int, altoPantalla: Int, x: Float, y: Float, angulo: Float, tamanio: Float, tiempo: Float, puntos: Int) {
		super(anchoPantalla, altoPantalla, tamanio, puntos, "images/npc_ball.png");
		setTiempoDeInmunidad(tiempo + 10);
		this.x = x;
		this.y = y;
		_fisica = new FisicaGravitacional(4, calculoDeVelocidad(), calculoDeAngulo(angulo), x, y, tiempo);
	}

	override public function getInmunityTime(): Float {
		return 10;
	}

	private function calculoDeVelocidad(): Float {
		return ((_VELOCIDAD_MAX - _VELOCIDAD_MIN) * y / _altoPantalla) + _VELOCIDAD_MIN;
	}

	private function calculoDeAngulo(angulo: Float): Float {
		if (_ANGULO_MAX > angulo)
			return ((_ANGULO_MAX - angulo) * y / _altoPantalla) + angulo;
		return ((angulo - _ANGULO_MAX) * (_altoPantalla - y) / _altoPantalla) + _ANGULO_MAX;
	}

	override public function kill(screen: GamePlayScreen, tiempo: Float) {
		super.kill(screen, tiempo);
		if (isDead() && height > 30) {
			screen.agregarNpc(crearHijo(Math.PI, tiempo));
			screen.agregarNpc(crearHijo(2 * Math.PI, tiempo));
		}
	}

	private function crearHijo(angulo: Float, tiempo: Float) {
		return new Pelota(
			_anchoPantalla,
			_altoPantalla,
			x + width/4,
			y + height/4,
			angulo,
			height / 2,
			tiempo,
			getPoints() * 2);
	}

}