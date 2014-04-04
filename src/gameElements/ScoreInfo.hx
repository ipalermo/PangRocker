package gameElements;

/**
 * ...
 * @author Mauricio
 */
class ScoreInfo
{
	private var points(default,null):Int;
	private var name:String;
	
	public function new(p:Int) 
	{
		points = p;
		name = "Rkr";		
	}
	
	public function getPoints():Int {
		return points;
	}
	
	public function getName():String {
		return name;
	}
	
	public function setName(n:String) {
		name = n;
	}
	
	public function setPoints(p:Int) {
		points = p;
	}
		
}