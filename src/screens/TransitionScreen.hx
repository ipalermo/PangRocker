package screens;

import gameElements.Image;

class TransitionScreen extends Screen {

	private var background : Image;	
	
	public function new(sm : ScreenManager) {
		super(sm);		
	}

	public function setBackGround( ground:String ) {
		this.background = new Image(ground, this.getScreenManager().getHeight());
		addChild(background);
	}
	
}