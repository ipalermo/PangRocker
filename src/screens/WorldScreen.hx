package screens;

import flash.display.Sprite;
import flash.events.MouseEvent;
import levels.FlightInformation;
import motion.Actuate;
import motion.easing.Elastic;
import motion.easing.Quad;
import sound.SoundManager;
import gameElements.Image;
import levels.LevelManager;
import flash.geom.Point;

class WorldScreen extends TransitionScreen {

	private var worldMap: Sprite;
	private var plane: Sprite;
	private var flightInfo: FlightInformation;
	
	public function new (sm:ScreenManager) {
		super (sm);
		worldMap = new Image("images/worldScreen/worldmap.jpg", getScreenManager().getHeight());
		plane = new Image("images/worldScreen/plane.png", 40); 
	}

	override public function init(time: Float) {
		flightInfo = LevelManager.getInstance().getLevel().getFlightInfo();
		worldMap.x = 0;
		worldMap.y = 0;
		
		plane.alpha = 0;
		plane.rotation = flightInfo.getRotation();
		plane.x = flightInfo.getDeparture().x; 
		plane.y = flightInfo.getDeparture().y;
		
		addChild (worldMap);
		addChild (plane);

		startFlight();
	}

	private function startFlight () {
		SoundManager.getInstance().playSong('plane');

		Actuate.tween (plane, 0.5, { alpha: 1 });
		Actuate.tween (plane, 3, { x: flightInfo.getDestination().x, y: flightInfo.getDestination().y }).delay(0.5).ease (Quad.easeInOut).onComplete(salir);
			
		LevelManager.getInstance().switchToNextLevel();
	}	

	private function salir() {
		getScreenManager().switchScene("game");
	}
}