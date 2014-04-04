package fisica;

class FisicaSenoidal extends Fisica {

	public function new(amplitud: Float, velocidadX: Float, velocidadY: Float, x: Float, y: Float, tiempo: Float) {
		super(
			new MovimientoLineal(0, velocidadX, x, tiempo),
			new MovimientoSenoidal(amplitud, y, velocidadY)
		);
	}

}