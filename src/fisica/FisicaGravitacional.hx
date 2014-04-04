package fisica;

class FisicaGravitacional extends Fisica {

	public function new(gravedad: Float, velocidad: Float, angulo: Float, x: Float, y: Float, tiempo: Float) {
		super(
			new MovimientoLineal(0, velocidad * Math.cos(angulo), x, tiempo),
			new MovimientoLineal(gravedad, velocidad * Math.sin(angulo), y, tiempo)
		);
	}

}