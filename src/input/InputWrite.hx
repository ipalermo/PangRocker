package input;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import screens.HighScoresScreen;

class InputWrite {

	private var _highScore: HighScoresScreen;

	private function new (highScore: HighScoresScreen) {
		_highScore = highScore;
		_highScore.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, onKeyDown);
	}

    private function onKeyDown(event:KeyboardEvent){
		_highScore.writeChar(event.charCode);
    }

}
