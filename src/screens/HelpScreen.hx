package screens;

import flash.text.TextField;
import gameElements.BackgroundMenu;
import gameElements.GameElement;
import gameElements.Image;
import gameElements.Animation;
import motion.Actuate;
import flash.events.MouseEvent;
import openfl.Assets;

class HelpScreen extends Screen {
	private var b1:Button;	
	private var play1dashD:Animation;
	private var play1shootD:Animation;
	private var play2dashD:Animation;
	private var play2shootD:Animation;	
	private var lrKey:Image;
	private var escKey:Image;
	private var adKey:Image;
	private var upKey:Image;
	private var wKey:Image;
	private var textoPausa: TextField;
	
	public function new(sm:ScreenManager) {
		super(sm);		
		
		var background: GameElement = new BackgroundMenu("images/background_menu.jpg", sm.getHeight()*2);

		addChild(background);		
		addLogicalChild(background);
				
		
		play1shootD = new Animation( Assets.getBitmapData("images/player1_shoot_der.png"), 6, 1);
		play1shootD.x = 300;
		play1shootD.y = 0;
		addChild(play1shootD);
		addLogicalChild(play1shootD);
		wKey = new Image("images/key_w.png", 50);
		wKey.x = 380;
		wKey.y = 5;
		addChild(wKey);
		
		play1dashD = new Animation( Assets.getBitmapData("images/player1_dash_der.png"), 8, 1);
		play1dashD.x = 300;
		play1dashD.y = 80;
		addChild(play1dashD);
		addLogicalChild(play1dashD);
		adKey = new Image("images/key_ad.png", 50);
		adKey.x = 380;
		adKey.y = 80;
		addChild(adKey);			
		
		textoPausa = new TextField();
		/*textoPausa.x = 200;
		textoPausa.y = 180;*/
		drawText(180, 150, 250, 50, 0xFFFFFF,textoPausa, "Pause");
		escKey = new Image("images/key_esc.png", 50);
		escKey.x = 380;
		escKey.y = 160;
		addChild(escKey);
				
		play2shootD = new Animation( Assets.getBitmapData("images/player2_shoot_der.png"), 6, 1);
		play2shootD.x = 300;
		play2shootD.y = 240;		
		addChild(play2shootD);			
		addLogicalChild(play2shootD);				
		upKey = new Image("images/key_up.png", 50);
		upKey.x = 380;
		upKey.y = 240;
		addChild(upKey);
		
		play2dashD = new Animation( Assets.getBitmapData("images/player2_dash_der.png"), 8, 1);
		play2dashD.x = 300;
		play2dashD.y = 320;
		addChild(play2dashD);
		addLogicalChild(play2dashD);
		lrKey = new Image("images/key_lr.png", 50);
		lrKey.x = 380;
		lrKey.y = 320;
		addChild(lrKey);
		
		b1 = new Button(400, 100, 0xFFFFFF, exit, 'Exit');		
		addChild(b1);
		
	}
	public function exit(evento:MouseEvent) {
		_screenManager.switchScene('menu');
	}

	override public function init(time: Float) {

		b1.x = 400;
		b1.width = 0;
		b1.height = 0;

		this.alpha = 0;		
		b1.y = 380;

		Actuate.tween(this, 0.2, { alpha:1 } );		
		Actuate.tween (b1, 1, { x: (800 - 400) / 2, width:400, height:100 } ).delay(0.15);
	}

	override public function end(onComplete:Dynamic) {
		this.alpha = 1;
		Actuate.tween(this, 1, { alpha:0 } ).onComplete(onComplete);
	}
	
	override public function updateLogic(time: Float) {
		super.updateLogic(time);
	}

}
	
