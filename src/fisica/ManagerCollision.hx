package fisica;

import flash.display.Sprite;
import gameElements.GameElement;
import gameElements.Personaje;

class ManagerCollision {

	private var elementos : Array<Personaje>;

	public function new() {
		elementos = new Array<Personaje>();
	}

	public function addElement(s : Personaje) {
		elementos.push(s);
	}

	public function removeElement(s : Personaje) {
		elementos.remove(s);
	}

	public function removeElements() {
		while (elementos.length > 0)
			elementos.pop();
	}

	public function getElementsAmount(): Int {
		return elementos.length;
	}

	public function getCollision(obj1:Personaje): Personaje {
		if (!obj1.isInmune()) {
			for (obj2 in elementos) {
				if (!obj2.isInmune())
					if (obj1.x + obj1.getSize().x > obj2.x && obj1.x < obj2.x + obj2.getSize().x)
						if (obj1.y + obj1.getSize().y > obj2.y && obj1.y < obj2.y + obj2.getSize().y)
							return obj2;
			}
		}
		return null;
	}

}
