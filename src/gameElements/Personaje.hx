package gameElements;

import screens.GamePlayScreen;
import flash.geom.Point;
import motion.Actuate;
import motion.easing.Quad;

class Personaje extends GameElement {

	private var _tiempoDeInmunidad: Float;
	private var boundingBox:Point;
	private var _lives: Int;
	private var _points: Int;

	public function new(points: Int) {
		super();
		this.boundingBox = null;
		_tiempoDeInmunidad = 0;
		_lives = 0;
		_points = points;
	}

	public function kill(screen: GamePlayScreen, tiempo: Float) {
		addLives(-1);
		if (!isDead()){
			this.alpha = 0;
			this.setTiempoDeInmunidad(tiempo + getInmunityTime());
			Actuate.tween(this, getInmunityTime() / 10, { alpha: 1 }, false ).ease(Quad.easeOut);
		}
		else {
			visible = false;
		}
	}

	public function getInmunityTime(): Float {
		return 0;
	}

	public function setTiempoDeInmunidad(tiempo: Float) {
		_tiempoDeInmunidad = tiempo;
	}

	public function isInmune() {
		return _tiempoDeInmunidad > 0;
	}

	override public function updateLogic(time:Float) {
		super.updateLogic(time);
		if (_tiempoDeInmunidad < time) {
			_tiempoDeInmunidad = 0;
		}
	}

	public function getLives(): Int {
		return _lives;
	}

	public function isDead(): Bool {
		return _lives < 1;
	}

	public function addLives(value: Int) {
		_lives += value;
	}

	public function getPoints(): Int {
		return _points;
	}

	public function getSize() {
		return this.boundingBox;
	}

}