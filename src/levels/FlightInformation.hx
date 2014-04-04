package levels;
import flash.geom.Point;

class FlightInformation
{
	private var departure: Point;
	private var destination: Point;
	private var rotation: Float;
	private var res: Point;
	
	public function new(depart: Point, dest: Point) 
	{
		departure = depart;
		destination = dest;
		res = dest.subtract(depart);
		rotation = Math.atan(res.y / res.x);
		rotation = (180 * rotation ) / Math.PI;
		if (departure.x < destination.x)
			//if (departure.y < destination.y)
				rotation = rotation + 180;
			/*else
				{trace(rotation); rotation = rotation + 90;}*/
		else
			if (departure.y < destination.y)
				rotation = rotation + 360;
	}
	
	public function getDeparture(): Point {
		return departure;
	}
	
	public function getDestination(): Point {
		return destination;
	}
	
	public function getRotation(): Float {
		return rotation;
	}
	
}