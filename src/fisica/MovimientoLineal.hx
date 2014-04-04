package fisica;

class MovimientoLineal implements Movimiento {

	private var _aceleracion: Float;
	private var _velocidad: Float;
	private var _posicion: Float;
	private var _ultimoTiempo: Float;

	public function new(aceleracion: Float, velocidad: Float, posicion: Float, tiempo: Float) {
		_aceleracion = aceleracion;
		_velocidad = velocidad;
		_posicion = posicion;
		_ultimoTiempo = tiempo;
	}

	public function getPosicion(tiempo: Float): Float {
		tiempo -= _ultimoTiempo;
		_velocidad += _aceleracion * tiempo;
		_posicion += tiempo * _velocidad;
		_ultimoTiempo += tiempo;
		return _posicion;
	}

	public function setPosicion(valor: Float) {
		_posicion = valor;
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