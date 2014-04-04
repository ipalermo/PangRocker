package fisica;

class Fisica {

	private var _movimientoX: Movimiento;
	private var _movimientoY: Movimiento;

	public function new(movimientoX: Movimiento, movimientoY: Movimiento) {
		_movimientoX = movimientoX;
		_movimientoY = movimientoY;
	}

	public function getX(tiempo: Float) {
		return _movimientoX.getPosicion(tiempo);
	}

	public function getY(tiempo: Float) {
		return _movimientoY.getPosicion(tiempo);
	}

	public function setX(valor: Float) {
		return _movimientoX.setPosicion(valor);
	}

	public function setY(valor: Float) {
		return _movimientoY.setPosicion(valor);
	}

	public function moverHaciaAbajo() {
		_movimientoY.setVelocidadPositiva();
	}

	public function moverHaciaArriba() {
		_movimientoY.setVelocidadNegativa();
	}

	public function moverHaciaDerecha() {
		_movimientoX.setVelocidadPositiva();
	}

	public function moverHaciaIzquierda() {
		_movimientoX.setVelocidadNegativa();
	}

}