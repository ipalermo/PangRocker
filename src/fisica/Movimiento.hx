package fisica;
//physaxe
interface Movimiento {

	public function getPosicion(tiempo: Float): Float;
	public function setPosicion(valor: Float): Void;
	public function setVelocidadPositiva(): Void;
	public function setVelocidadNegativa(): Void;

}