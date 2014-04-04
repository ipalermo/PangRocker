package input;

class InputConfiguration {

	private var _leftKeyCode: Int;
	private var _rightKeyCode: Int;
	private var _upKeyCode: Int;
	private var _downKeyCode: Int;
	private var _shootKeyCode: Int;
	private var _escapeKeyCode: Int;
	private var _initKeyCode: Int;
	private static var _input: InputManager;

	public function new(leftKeyCode: Int, rightKeyCode: Int, upKeyCode: Int, downKeyCode: Int ,escapeKeyCode:Int) {
		_leftKeyCode = leftKeyCode;
		_rightKeyCode = rightKeyCode;
		_upKeyCode = upKeyCode;
		_downKeyCode = downKeyCode;
		_shootKeyCode = upKeyCode;
		_escapeKeyCode = escapeKeyCode;
		_input = InputManager.getInstance();
	}

	public function movingToLeft(): Bool {
		return _input.keyCodePressed(_leftKeyCode);
	}

	public function movingToRight(): Bool {
		return _input.keyCodePressed(_rightKeyCode);
	}

	public function movingUp(): Bool {
		return _input.keyCodePressed(_upKeyCode);
	}

	public function movingDown(): Bool {
		return _input.keyCodePressed(_downKeyCode);
	}

	public function shooting(): Bool {
		return _input.keyCodePressed(_shootKeyCode);
	}
	
	public function escape(): Bool {
		return _input.keyCodePressed(_escapeKeyCode);
	}
	
	public function init(): Bool {
		return _input.keyCodePressed(_initKeyCode);
	}

}