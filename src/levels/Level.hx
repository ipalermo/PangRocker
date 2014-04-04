package levels;

import flash.geom.Point;
import haxe.ds.StringMap.StringMap;

class Level {

	private var elements: Map<String, String>;
	private var _ballsAmount: Array<Int>;
	private var _pigsAmount: Array<Int>;
	private var _timeBallsDelay: Float;
	private var _timePigsDelay: Float;
	private var _timeBegin: Float;
	private var _lastGetBall: Int;
	private var _lastGetPig: Int;
	private var lastOfStage: Bool;
	private var _flightInfo: FlightInformation;

	public function new(ballsAmount: Array<Int>, pigsAmount: Array<Int>, timeBallsDelay: Float, timePigsDelay: Float, lastOfStage: Bool) {
		elements = new Map <String, String> ();
		_ballsAmount = ballsAmount;
		_pigsAmount = pigsAmount;
		_timeBallsDelay = timeBallsDelay;
		_timePigsDelay = timePigsDelay;
		this.lastOfStage = lastOfStage;
	}

	public function getBallsAmount(time: Float): Int {
		if (!hasMoreBalls())
			return 0;
		var pos: Int = Math.floor((time - _timeBegin) / _timeBallsDelay);
		if (pos <= _lastGetBall)
			return 0;
		_lastGetBall = Math.floor(Math.min(pos, _ballsAmount.length-1));
		return _ballsAmount[_lastGetBall];
	}

	public function getPigsAmount(time: Float): Int {
		if (!hasMorePigs())
			return 0;
		var pos: Int = Math.floor((time - _timeBegin) / _timePigsDelay);
		if (pos <= _lastGetPig)
			return 0;
		_lastGetPig = Math.floor(Math.min(pos, _pigsAmount.length-1));
		return _pigsAmount[_lastGetPig];
	}

	public function setTimeBegin(time: Float) {
		_timeBegin = time;
		_lastGetBall = -1;
		_lastGetPig = -1;
	}

	private function hasMoreBalls(): Bool {
		return _lastGetBall < _ballsAmount.length - 1;
	}

	public function hasMoreNpcs(): Bool {
		return !(!hasMoreBalls() && !hasMorePigs());
	}

	private function hasMorePigs(): Bool {
		return _lastGetPig < _pigsAmount.length - 1;
	}

	public function put(key : String, obj : String) {
		elements.set(key,obj);
	}

	public function get(key): String {
		return elements.get(key);
	}

	public function isLastOfStage(): Bool {
		return lastOfStage;
	}

	public function getFlightInfo(): FlightInformation {
		return _flightInfo;
	}
	
	public function setFlightInfo(info: FlightInformation ) {
		_flightInfo = info;
	}
}