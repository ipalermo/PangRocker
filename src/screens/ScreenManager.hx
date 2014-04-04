package screens;
import flash.display.Sprite;
import flash.display.Stage;

class ScreenManager extends Sprite {

	private var _currentScreen : Screen;
	private var _screens: Map<String, Screen>;
	private var _screenTimes: Map<Screen, Float>;
	private var _otherScreensTime: Float;
	private var _mainStage: Stage;
	private var score1:Int;
	private var score2:Int;

	public function new(mainStage:Stage) {
		super();
		_mainStage = mainStage;
		_screens = new Map<String, Screen>();
		_screenTimes = new Map<Screen, Float>();
		score1 = 0;
		score2 = 0;
	}

	public function switchScene(name:String) {
		var escene: Screen = _screens.get(name);
		if (_currentScreen != null) {
			_currentScreen.end(
				function(){
					removeChild(_currentScreen);
					setCurrentScreen(escene);
					}
			);
			
		} else {
			setCurrentScreen(escene);
		}
	}

	private function setCurrentScreen(screen: Screen) {
		_currentScreen = screen;
		addChild(_currentScreen);
		actualizarTiempos();
		_currentScreen.init(_screenTimes.get(_currentScreen));
		_mainStage.focus = _currentScreen;
	}

	private function actualizarTiempos() {
		_otherScreensTime = 0;
		for (time in _screenTimes) {
			_otherScreensTime += time;
		}
		_otherScreensTime -= _screenTimes.get(_currentScreen);
	}

	public function suscribeScreen(name:String, screen:Screen) {
		_screens.set(name, screen);
		_screenTimes.set(screen, 0);
		if (_currentScreen == null) {
			setCurrentScreen(screen);
		}
	}

	public function updateLogic(time: Float) {
		time -= _otherScreensTime;
		_currentScreen.updateLogic(time);
		_screenTimes.set(_currentScreen, time);
	}

	public function getWidth():Int {
		return _mainStage.stageWidth;
	}

	public function getHeight():Int {
		return _mainStage.stageHeight;
	}

	public function addNewScores(points1:Int, points2:Int) {
		//var screenScores : HighScoresScreen = cast(_screens.get('scores'));
		//screenScores.addNewScore(points1,points2);
		score1 = points1;
		score2 = points2;
	}

	public function getScore1() :Int {
		return score1;
	}
		
	public function getScore2() :Int {
		return score2;
	}
}