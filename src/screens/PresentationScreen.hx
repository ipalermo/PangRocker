package screens;

import flash.display.Sprite;
import flash.events.MouseEvent;
import motion.Actuate;
import motion.easing.Elastic;
import motion.easing.Quad;
import sound.SoundManager;
import gameElements.Image;


class PresentationScreen extends Screen {

	private var _gameLogo: Sprite;
	private var _companyLogo: Sprite;

	public function new (sm:ScreenManager) {
		super (sm);
		_gameLogo = new Image("images/presentationScreen/logo_pangrocker.png", sm.getHeight());
		_companyLogo = new Image("images/presentationScreen/logo_fe.png", sm.getHeight() / 2);
	}

	override public function init(time: Float) {
		_gameLogo.alpha = 0;
		_gameLogo.x = (getScreenManager().getWidth() - _gameLogo.width) / 2;
		_gameLogo.y = (getScreenManager().getHeight() - _gameLogo.height) / 2;

		_companyLogo.alpha = 0;
		_companyLogo.x = (getScreenManager().getWidth() - _companyLogo.width) / 2;
		_companyLogo.y = (getScreenManager().getHeight() - _companyLogo.height) / 2;

		addChild (_gameLogo);
		addChild (_companyLogo);

		Actuate.tween (_companyLogo, 5, { alpha: 1 } ).ease(Quad.easeOut);
		Actuate.tween (_companyLogo, 5, { alpha: 0 }, false).ease(Quad.easeOut).delay(2).onComplete(showGameLogo);
	}

	private function showGameLogo () {
		SoundManager.getInstance().playSong('presentation.song');
		_gameLogo.scaleX = _gameLogo.scaleY = 0;
		_gameLogo.buttonMode = true;

		Actuate.tween (_gameLogo, 2, { alpha: 1, scaleX: 1, scaleY: 1 }).ease (Elastic.easeOut);
		_gameLogo.addEventListener(MouseEvent.CLICK, play);

	}	

	private function play(evento:MouseEvent) {
		getScreenManager().switchScene('menu');
	}
}