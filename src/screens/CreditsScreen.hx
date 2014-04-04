package screens;

import flash.text.TextField;
import gameElements.BackgroundMenu;
import gameElements.GameElement;
import gameElements.Image;
import gameElements.Animation;
import motion.Actuate;
import flash.events.MouseEvent;
import openfl.Assets;
import sound.SoundManager;

class CreditsScreen extends Screen {

	private var b1:Button;
	private var text1:TextField;
	private var text2:TextField;
	private var text3:TextField;
	private var text4:TextField;

	public function new(sm:ScreenManager) {
		super(sm);		
		var background: GameElement = new BackgroundMenu("images/background_menu.jpg", sm.getHeight()*2);
		addChild(background);
		b1 = new Button(400, 100, 0xFFFFFF, exit, 'Exit');
		text1 = new TextField();
		text2 = new TextField();
		text3 = new TextField();
		text4 = new TextField();
		drawText((getScreenManager().getWidth()-350)/2, 50, 350, 50, 0xFFFFFF, text1, "Sebastián Freites");
		drawText((getScreenManager().getWidth()-350)/2, 100, 350, 50, 0xFFFFFF, text2, "Ignacio Palermo");
		drawText((getScreenManager().getWidth()-350)/2, 150, 350, 50, 0xFFFFFF, text3, "Mauricio Piccolo");
		drawText((getScreenManager().getWidth()-350)/2, 200, 350, 50, 0xFFFFFF, text4, "Julio Rivera");
		addChild(b1);		

		addLogicalChild(background);
	}

	public function exit(evento:MouseEvent) {
		getScreenManager().switchScene('menu');
	}

	override public function init(time: Float) {		
		b1.x = 400;
		b1.width = 0;
		b1.height = 0;

		this.alpha = 0;		
		b1.y = 300;

		Actuate.tween(this, 0.2, { alpha:1 } );		
		Actuate.tween (b1, 1, { x: (800 - 400) / 2, width:400, height:100 } ).delay(0.15);
	}

	override public function end(onComplete:Dynamic) {
		this.alpha = 1;
		Actuate.tween(this, 1, { alpha:0 } ).onComplete(onComplete);
	}

}