package fisica;

class MovimientoSenoidal implements Movimiento {

	private var _amplitud: Float;
	private var _centro: Float;
	private var _velocidad: Float;

	public function new(amplitud: Float, centro: Float, velocidad: Float) {
		_amplitud = amplitud;
		_centro = centro;
		_velocidad = velocidad;
	}

	public function getPosicion(tiempo: Float): Float {
		return _centro + _amplitud * Math.sin(tiempo * _velocidad);
	}

	public function setPosicion(valor: Float) {
		_centro = valor;
	}

	private function invertirVelocidad() {
		_velocidad *= -1;
	}

	public function setVelocidadPositiva() {
		if (_velocidad < 0)
			invertirVelocidad();
	}

	public function setVelocidadNegativa() {
		if (_velocidad > 0)
			invertirVelocidad();
	}

}