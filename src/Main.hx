package;

import flash.display.Sprite;
import gameElements.GameElement;
import gameElements.Image;
import gameElements.Rocker;
import gameElements.Pelota;
import haxe.Timer;
import input.InputConfiguration;
import input.InputManager;
import screens.CreditsScreen;
import screens.HelpScreen;
import screens.HighScoresScreen;
import screens.LoseScreen;
import screens.ScreenManager;
import screens.GamePlayScreen;
import screens.PauseScreen;
import screens.MenuScreen;
import screens.PresentationScreen;
import screens.StageTransitionScreen;
import screens.WorldScreen;

class Main extends Sprite {

	private static var _ANCHO_PANTALLA = 800;
	private static var _ALTO_PANTALLA = 480;

	private var screenManager : ScreenManager;
	private var beginTime : Float;

	public function new () {
		super();
		this.beginTime = Timer.stamp();
		screenManager = new ScreenManager(stage);
		screenManager.suscribeScreen('presentation',new PresentationScreen(screenManager));
		screenManager.suscribeScreen('menu', new MenuScreen(screenManager));
		screenManager.suscribeScreen('credits',new CreditsScreen(screenManager));
		screenManager.suscribeScreen('game', new GamePlayScreen(screenManager));
		screenManager.suscribeScreen('pause', new PauseScreen(screenManager));
		screenManager.suscribeScreen('help', new HelpScreen(screenManager));
		screenManager.suscribeScreen('stageTransition', new StageTransitionScreen(screenManager));
		screenManager.suscribeScreen('worldTransition', new WorldScreen(screenManager));
		screenManager.suscribeScreen('lose', new LoseScreen(screenManager));
		screenManager.suscribeScreen('scores',new HighScoresScreen(screenManager));
		addChild(screenManager);
		stage.addEventListener(flash.events.Event.ENTER_FRAME, gameLoop);
		stage.addEventListener(flash.events.Event.RESIZE,onResize);
		InputManager.getInstance().suscribe(stage);
	}

	function gameLoop(e) {		
		screenManager.updateLogic((Timer.stamp()- beginTime) * 10);
	}	

	function onResize(e){
		var scaleX:Float = stage.stageWidth / _ANCHO_PANTALLA;
		var scaleY:Float = stage.stageHeight / _ALTO_PANTALLA;
		this.scaleX = this.scaleY = Math.min(scaleX, scaleY);
		this.x = (stage.stageWidth - (_ANCHO_PANTALLA * this.scaleX)) / 2;
		this.y = (stage.stageHeight - (_ALTO_PANTALLA * this.scaleY)) / 2;
	}

}