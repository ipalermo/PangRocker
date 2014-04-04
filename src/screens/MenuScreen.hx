package screens;

import flash.events.MouseEvent;
import gameElements.BackgroundMenu;
import gameElements.GameElement;
import motion.Actuate;
import sound.SoundManager;

class MenuScreen extends Screen {

	private var b1:Button;
	private var b2:Button;
	private var b3:Button;

	public function new(sm:ScreenManager) {
		super(sm);
		b1 = new Button(400, 100, 0xFFFFFF, play, 'PLAY');
		b2 = new Button(400, 100, 0xFFFFFF, help, 'HELP');
		b3 = new Button(400, 100, 0xFFFFFF, credits, 'CREDITS');
		var background: GameElement = new BackgroundMenu("images/background_menu.jpg", sm.getHeight()*2);

		addChild(background);
		addChild(b1);
		addChild(b2);
		addChild(b3);

		addLogicalChild(background);
	}

	public function play(evento:MouseEvent) {
		getScreenManager().switchScene('game');
		SoundManager.getInstance().stopSong("presentation.song");
	}

	public function help(evento:MouseEvent) {
		getScreenManager().switchScene('help');
	}

	public function credits(evento:MouseEvent) {
		getScreenManager().switchScene('credits');
	}
	
	override public function init(time: Float) {
		b1.x = 400;
		b1.width = 0;
		b1.height = 0;

		b2.x = 400;
		b2.width = 0;
		b2.height = 0;

		b3.x = 400;
		b3.width = 0;
		b3.height = 0;

		this.alpha = 0;
		b1.y = 100;
		b2.y = 200;
		b3.y = 300;

		Actuate.tween(this, 0.2, { alpha:1 } );
		Actuate.tween (b1, 1, { x: (800 - 400) / 2, width:400, height:100 } );
		Actuate.tween (b2, 1, { x: (800 - 400) / 2, width:400, height:100 } ).delay(0.15);
		Actuate.tween (b3, 1, { x: (800 - 400) / 2, width:400, height:100 } ).delay(0.25);
		SoundManager.getInstance().playSong("presentation.song");
	}

	override public function end(onComplete:Dynamic) {
		this.alpha = 1;
		Actuate.tween(this, 1, { alpha:0 } ).onComplete(onComplete);
	}

}