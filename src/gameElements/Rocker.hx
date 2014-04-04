package gameElements;

import flash.display.Bitmap;
import flash.geom.Point;
import input.InputConfiguration;
import openfl.Assets;
import screens.GamePlayScreen;
import gameElements.Score;
import sound.SoundManager;

class Rocker extends Personaje {	

	private var idleI:Animation;
	private var idleD:Animation;
	private var dashI:Animation;
	private var dashD:Animation;
	private var shootI:Animation;
	private var shootD:Animation;	
	private var victoryI:Animation;
	private var victoryD:Animation;
	private var disparo:Disparo;
	private var numPlayer:Int;

	private var score : Score;
	private var watchingLeft:Bool;
	private var celebrating:Bool;
	private var speed: Float;
	private var input:InputConfiguration;
	private var anchoPantalla: Int;
	private var soundManager: SoundManager;

	public function new(input: InputConfiguration, x: Float, anchoPantalla: Int, altoPantalla: Int, numPlayer: Int) {
		super(0);
		score = new Score();
		this.input = input;
		this.watchingLeft = true;
		this.celebrating = false;
		this.speed = 5;
		this.anchoPantalla = anchoPantalla;
		this.x = x;
		agregarAnimaciones(numPlayer, altoPantalla);
		this.y = altoPantalla - getSize().y;
		this.numPlayer = numPlayer;
		soundManager = SoundManager.getInstance();
	}

	override public function getInmunityTime(): Float {
		return 20;
	}

	public function initialite(screen: GamePlayScreen, time: Float):Void {
		setCelebrating(false);
		if (isDead()) {
			score.initPoints();
			addLives(4);
		}
		else
			addLives(1);
		kill(screen, time);
	}

	public function setCelebrating(value: Bool) {
		celebrating = value;
	}

	private function agregarAnimaciones(numPlayer: Int, altoDePantalla: Int) {
		idleI = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_idle_izq.png"), 8, 1);
		idleD = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_idle_der.png"), 8, 1);
		dashI = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_dash_izq.png"), 8, 1);
		dashD = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_dash_der.png"), 8, 1);
		victoryI = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_victory_izq.png"), 8, 1);
		victoryD = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_victory_der.png"), 8, 1);
		shootI = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_shoot_izq.png"), 6, 1);
		shootD = new Animation( Assets.getBitmapData("images/player" + numPlayer + "_shoot_der.png"), 6, 1);

		this.boundingBox = new Point(idleD.getWidth(), victoryD.getHeight());
		disparo = new Disparo(altoDePantalla - getSize().y/2);

		addLogicalChild(idleI);
		addLogicalChild(idleD);
		addLogicalChild(dashI);
		addLogicalChild(dashD);
		addLogicalChild(victoryI);
		addLogicalChild(victoryD);
		addLogicalChild(shootI);
		addLogicalChild(shootD);
		addLogicalChild(disparo);

		this.addChild(idleI);
		this.addChild(idleD);
		this.addChild(dashI);
		this.addChild(dashD);
		this.addChild(victoryI);
		this.addChild(victoryD);
		this.addChild(shootI);
		this.addChild(shootD);
	}

	override public function updateLogic(time:Float) {
		super.updateLogic(time);
		setAnimacionesVisible(false);
		if (celebrating) {
			soundManager.playSong("celebrating");
			victoryI.visible = watchingLeft;
			victoryD.visible = !watchingLeft;
		}
		else {
			if (input.movingToLeft()) {
				watchingLeft = true;
				dashI.visible = true;
				if (x > 0)
					x -= speed;
			}
			else {
				if (input.movingToRight()) {
					watchingLeft = false;
					dashD.visible = true;
					if (x + this.getSize().x < anchoPantalla)
						x += speed;
				}
				else {
					if (input.shooting()) {
						soundManager.playSong("guitar" + numPlayer);
						disparo.setPosition(this.x, 0);
						disparo.visible = true;
						shootI.visible = watchingLeft;
						shootD.visible = !watchingLeft;
					}
					else {
						idleI.visible = watchingLeft;
						idleD.visible = !watchingLeft;
					}
				}
			}
		}
	}

	private function setAnimacionesVisible(value: Bool) {
		idleI.visible = value;
		idleD.visible = value;
		dashI.visible = value;
		dashD.visible = value;
		shootI.visible = value;
		shootD.visible = value;
		disparo.visible = value;
		victoryI.visible = value;
		victoryD.visible = value;
	}

	override public function kill(screen: GamePlayScreen, time: Float) {
		super.kill(screen, time);
		disparo.kill(screen, time);
	}

	public function getDisparo(): Disparo {
		return disparo;
	}

	public function addPoints(points: Int) {
		score.addPoints(points);
	}

	override public function getPoints(): Int {
		return score.getPoints();
	}

	public  function escape(): Bool {
		return input.escape();
	}

}