package gameElements;

class Score {

	private var points: Int;

	public function new() {
		initPoints();
	}

	public function addPoints(points: Int) {
		this.points += points;
	}	

	public function getPoints() : Int {
		return points;
	}

	public function initPoints() {
		points = 0;
	}

}