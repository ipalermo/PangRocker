package screens;

import flash.text.TextField;
import gameElements.Image;
import gameElements.GameElement;
import levels.LevelManager;
import motion.Actuate;
import sound.SoundManager;

class StageTransitionScreen extends TransitionScreen {

	private var textScreen : TextField; 		
	
	public function new(sm : ScreenManager) {
		super(sm);
		background = new Image("images/background_stage_transition.jpg", getScreenManager().getHeight());		
		addChild(background);
		textScreen = new TextField();
		drawText(this.getScreenManager().getWidth() / 2, (this.getScreenManager().getHeight() - 200) / 2, 300, 100, 0x000000 , this.textScreen, "");
	}

	override public function init(time: Float) {
		textScreen.alpha = 0;
		SoundManager.getInstance().playSong("transition.song");
 		LevelManager.getInstance().switchToNextLevel();
		textScreen.x = this.getScreenManager().getWidth() / 2;
		textScreen.y = (this.getScreenManager().getHeight() - 200) / 2;
		textScreen.text = LevelManager.getInstance().getLevel().get("title");
		Actuate.tween(this.textScreen, 0.2, { alpha:1 } );
		Actuate.tween (this.textScreen, 1, { x: (800 - 400) / 2, width:400, height:100 } ).delay(0.15);
		getScreenManager().switchScene("game");
	}

	override public function end(onComplete:Dynamic) {
		SoundManager.getInstance().stopSong("transition.song");
		Actuate.tween(this, 5, { alpha:1 } ).onComplete(onComplete);
	}

	public function setTextScreen(text : String) {
		this.textScreen.text = text;
	}
	
	override public function updateLogic(time: Float) {
		super.updateLogic(time);
	}
	
}