package input;

import flash.display.Stage;
import flash.events.KeyboardEvent;

class InputManager {

	private static var instance:InputManager = null;

	private var teclas:Array<Bool>;

	public static function getInstance():InputManager{
		if(instance==null){
			instance=new InputManager();
		}
		return instance;
	} 

	private function new () {
		teclas=new Array<Bool>();
	}

	public function suscribe(stage:Stage){
		stage.addEventListener(flash.events.KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, onKeyDown);
	}

    private function onKeyUp(event:KeyboardEvent){
    	teclas[event.keyCode]=false;
    }

    private function onKeyDown(event:KeyboardEvent){
		teclas[event.keyCode] = true;
    }

    public function keyCodePressed(keyCode:Int):Bool{
    	return teclas[keyCode];
    }

}
