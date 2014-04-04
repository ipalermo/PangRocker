package screens;

import fisica.ManagerCollision;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import gameElements.Chancho;
import gameElements.Disparo;
import gameElements.GameElement;
import gameElements.Image;
import gameElements.Npc;
import gameElements.Personaje;
import gameElements.Rocker;
import gameElements.Pelota;
import input.InputConfiguration;
import levels.LevelManager;
import motion.Actuate;
import motion.easing.Quad;
import sound.SoundManager;

class GamePlayScreen extends Screen {

	private static var _TAMANIO_INICIAL_PELOTA: Float = 150;

//después tenemos que revisar si el arreglo de no activos sirve o esta al pedo, porque para mi que esta al pedo. Seba
	private var _noActivos : Array<GameElement>;
	private var _activos : Array<GameElement>;
	private var _rocker1:Rocker;
	private var _rocker2:Rocker;	
	private var _managerDeColisiones:ManagerCollision;
	private var _managerDeNiveles:LevelManager;
	private var textScore1:TextField;
	private var textScore2:TextField;
	private var textLifes1:TextField;
	private var textLifes2:TextField;
	private var textGame:TextField;
	private var textTitle:TextField;
	private var textBallPoint:TextField;
	private var soundManager : SoundManager;
	private var stopedUpdate : Bool;

	public function new(sm: ScreenManager) {
		super(sm);
		_activos = new Array<GameElement>();
		_noActivos = new Array<GameElement>();

		stopedUpdate = true;
		_managerDeNiveles = LevelManager.getInstance();
		_managerDeColisiones = new ManagerCollision();
		soundManager = SoundManager.getInstance();
		var inputConfig1:InputConfiguration = new InputConfiguration(65, 68, 87, 83, 27);//a d w s
		var inputConfig2:InputConfiguration = new InputConfiguration(37, 39, 38, 40, 27);//izquierda derecha arriba abajo
		_rocker1 = new Rocker(inputConfig1, 100, getScreenManager().getWidth(), getScreenManager().getHeight(), 1);
		_rocker2 = new Rocker(inputConfig2, 500, getScreenManager().getWidth(), getScreenManager().getHeight(), 2);
	}

	private function crearContadorDeVidas() {
		var imageLife1: GameElement = new Image("images/player1_guitar.png", 80);
		imageLife1.x = 20;
		imageLife1.y = 10;
		this.addChild(imageLife1);
		var imageLife2: GameElement = new Image("images/player2_guitar.png", 80);
		imageLife2.x = getScreenManager().getWidth()-50;
		imageLife2.y = 10;
		this.addChild(imageLife2);
	}

	private function crearNpcs(time: Float) {
		for( i in 0 ... _managerDeNiveles.getLevel().getBallsAmount(time)) {
			agregarNpc(new Pelota(
				getScreenManager().getWidth(),
				getScreenManager().getHeight(),
				Math.random() * (getScreenManager().getWidth() - _TAMANIO_INICIAL_PELOTA),
				Math.random() * (getScreenManager().getHeight() / 4 - _TAMANIO_INICIAL_PELOTA),
				Math.random() * 2 * Math.PI,
				_TAMANIO_INICIAL_PELOTA,
				time,
				5));
		}
		for( i in 0 ... _managerDeNiveles.getLevel().getPigsAmount(time)) {
			agregarNpc(new Chancho(
				getScreenManager().getWidth(),
				getScreenManager().getHeight(),
				(Math.random() + 1) * _TAMANIO_INICIAL_PELOTA/2,
				time,
				37));
		}
	}

	private function cargarTextos() {
		textBallPoint = new TextField();
		textScore1 = new TextField();
		textScore2 = new TextField();
		textLifes1 = new TextField();
		textLifes2 = new TextField();
		textGame = new TextField();
		textTitle = new TextField();
		textBallPoint.alpha = 0;
		textGame.alpha = 0;
		drawText((getScreenManager().getWidth() - 450) / 2, (getScreenManager().getHeight() - 50) / 2, 450, 50, 0xFFFFFF, this.textGame, "");
		drawText((getScreenManager().getWidth() - 450) / 2, 10, 450, 50, 0xFFFFFF, this.textTitle, _managerDeNiveles.getLevel().get("title"));
		drawText(100, 10, 150, 50, 0xFFFFFF,this.textScore1, _rocker1.getPoints() + "");
		drawText(0, 10, 150, 50, 0xFFFFFF,this.textLifes1, _rocker1.getLives() + "");
		drawText(getScreenManager().getWidth() - 100 - 150, 10, 150, 50, 0xFFFFFF, this.textScore2, _rocker2.getPoints() + "");
		drawText(getScreenManager().getWidth() - 150, 10, 150, 50, 0xFFFFFF, this.textLifes2, _rocker2.getLives() + "");
		drawText(getScreenManager().getWidth()/2, getScreenManager().getHeight()/2, 150, 50, 0xFFFFFF,this.textBallPoint, 0 + "");
	}

	public override function updateLogic(time:Float) {
		crearNpcs(time);
		for(activo in _activos){
			activo.updateLogic(time);
		}
		checkearColisiones(_rocker1, time);
		textLifes1.text = _rocker1.getLives() + "";
		checkearColisiones(_rocker2, time);
		textLifes2.text = _rocker2.getLives() + "";
		if (!stopedUpdate) {
			if (_rocker1.isDead() && _rocker2.isDead()) {	//GAME OVER
				soundManager.playSong("gameover");
				textGame.text = "Game over";
				stopedUpdate = true;
				Actuate.tween(this.textGame, 5, { alpha: 1 },false ).ease(Quad.easeOut).delay(2).onComplete(salirPerdiendo);
			}
			else {
				if (_managerDeColisiones.getElementsAmount() == 0 && !_managerDeNiveles.getLevel().hasMoreNpcs()) {	//WIN
					_rocker1.setCelebrating(true);
					_rocker2.setCelebrating(true);
					textGame.text = _managerDeNiveles.getLevel().get("title") +" Completed";
					stopedUpdate = true;
					Actuate.tween(this.textGame, 5, { alpha: 1 },false ).ease(Quad.easeOut).delay(2).onComplete(salirGanando);
				}
			}
			this.textScore1.text = _rocker1.getPoints() + "";
			this.textScore2.text = _rocker2.getPoints() + "";
			if(_rocker1.escape() || _rocker2.escape()){
				goBack();
			}
		}
	}

	private function salirGanando() {
		if (_managerDeNiveles.getLevel().isLastOfStage())
			getScreenManager().switchScene("worldTransition");
		else
			getScreenManager().switchScene("stageTransition");
	}

	private function salirPerdiendo() {
		getScreenManager().addNewScores(_rocker1.getPoints(), _rocker2.getPoints());
		getScreenManager().switchScene("lose");
	}

	private function checkearColisiones(r: Rocker, tiempo: Float) {
		if (!r.isDead()) {
			if (_managerDeColisiones.getCollision(r) != null) {
				soundManager.playSong("loseLife");
				r.kill(this, tiempo);
				if (r.isDead()) {
					_activos.remove(r);
					_activos.remove(r.getDisparo());
					removeChild(r);
					removeChild(r.getDisparo());
				}
			}
			if (r.getDisparo().visible) {
				var pelota: Personaje = _managerDeColisiones.getCollision(r.getDisparo());
				var aux : Int;
				if (pelota != null) {
					mostrarPuntajeNpc(pelota);
					r.addPoints(pelota.getPoints());
					pelota.kill(this, tiempo);
					if (pelota.isDead()) {
						_activos.remove(pelota);
						_noActivos.push(pelota);
						_managerDeColisiones.removeElement(pelota);
					}
					soundManager.playSong("soundshoot");
				}
			}
		}
	}

	private function mostrarPuntajeNpc(npc: Personaje) {
		textBallPoint.text = npc.getPoints() + "";
		textBallPoint.x = npc.x;
		textBallPoint.y = npc.y;
		Actuate.tween(this.textBallPoint, 1, { alpha: 1 }, false ).ease(Quad.easeOut).onComplete(borrar);
		
	}
	public function borrar() {
		Actuate.tween(this.textBallPoint, 3, { alpha:0 } );
	}

	public function agregarNpc(npc: Npc) {
		_managerDeColisiones.addElement(npc);
		addChild(npc);
		_activos.push(npc);
	}

	override public function init(time: Float):Void {
		if (stopedUpdate) {
			_rocker1.initialite(this, time);
			_rocker2.initialite(this, time);
			addChild(new Image(_managerDeNiveles.getLevel().get("background"), getScreenManager().getHeight()));
	
			stopedUpdate = false;
			_rocker1.setCelebrating(false);
			_rocker2.setCelebrating(false);
			addChild(_rocker1);
			addChild(_rocker2);
			addChild(_rocker1.getDisparo());
			addChild(_rocker2.getDisparo());

			_activos.push(_rocker1);
			_activos.push(_rocker2);
			_activos.push(_rocker1.getDisparo());
			_activos.push(_rocker2.getDisparo());
			cargarTextos();
			crearContadorDeVidas();

			_managerDeNiveles.getLevel().setTimeBegin(time);
		}
		soundManager.playSong(_managerDeNiveles.getLevel().get("songLevel"));
	}

	private function drawImage(posx :Float, posy : Float, scale: Float, image: Image) {
		image.x = posx;
		image.y = posy;		
		image.setSize(scale);
	}

	private function goBack(){
		getScreenManager().switchScene('pause');
	}

	override public function end(onComplete:Dynamic) {
		if (stopedUpdate) {
			while (numChildren > 0)
				removeChildAt(0);
			_managerDeColisiones.removeElements();
			while (_activos.length > 0)
				_activos.pop();
		}
		soundManager.stopSong(_managerDeNiveles.getLevel().get("songLevel"));
		super.end(onComplete);
	}
}