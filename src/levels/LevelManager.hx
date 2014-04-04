package levels;

import flash.geom.Point;

class LevelManager {

	private static var _INSTANCE: LevelManager;
	private static var _CANT_LEVELS: Int = 13;

	private var current: Int;
	private var factorDeDificultad: Float;
	private var level: Level;

	public static function getInstance(): LevelManager {
		if (_INSTANCE == null)
			_INSTANCE = new LevelManager();
		return _INSTANCE;
	}

	private function new() {
		current = 1;
		factorDeDificultad = 1;
		loadLevel(current);
	}

	private function loadLevel(levelNumber: Int) {
		switch(levelNumber) {
			case 1: {
				level = new Level([0, 1, 0, 1, 0, 0, 1, 0, 1, 1], [0], 60 * factorDeDificultad, 1 * factorDeDificultad, false);
				level.put("title", "Level 1");
				level.put("songLevel", "level2.song");
				level.put("background", "images/stage1/level2.jpg");
			}
			case 2: {
				level = new Level([0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1], [0, 1, 0, 1], 60 * factorDeDificultad, 240 * factorDeDificultad, true);
				level.put("title", "Level 2");
				level.put("songLevel", "level1.song");
				level.put("background", "images/stage1/level1.jpg");
				level.setFlightInfo(new FlightInformation(new Point(240, 380), new Point(130, 200)));
			}
			case 3: {
				level = new Level([0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 2, 0, 1, 0, 2], 90 * factorDeDificultad, 175 * factorDeDificultad, false);
				level.put("title", "Level 3");
				level.put("songLevel", "level3.song");
				level.put("background", "images/stage2/level3.jpg");
			}
			case 4: {
				level = new Level([0, 0, 1, 1, 1, 1, 0, 1, 2, 1, 1, 0, 0, 2, 1, 1, 0, 0, 2, 1, 1, 1, 0, 1, 0, 1, 0, 2], [0, 1, 0, 2, 0, 2, 2, 2, 2, 0, 0, 1, 0, 2], 90 * factorDeDificultad, 180 * factorDeDificultad, true);
				level.put("title", "Level 4");
				level.put("songLevel", "level4.song");
				level.put("background", "images/stage2/level4.jpg");
				level.setFlightInfo(new FlightInformation(new Point(140, 240), new Point(700, 420)));
			}
			case 5: {
				level = new Level([0, 1, 1, 1, 2], [0, 2], 90 * factorDeDificultad, 540 * factorDeDificultad, false);
				level.put("title", "Level 5");
				level.put("songLevel", "level5.song");
				level.put("background", "images/stage3/level5.jpeg");
			}
			case 6: {
				level = new Level([0, 1, 0, 1, 1], [0, 2], 120 * factorDeDificultad, 170 * factorDeDificultad, true);
				level.put("title", "Level 6");
				level.put("songLevel", "level6.song");
				level.put("background", "images/stage3/level6.jpg");
				level.setFlightInfo(new FlightInformation(new Point(680, 350), new Point(370, 130)));
			}
			case 7: {
				level = new Level([0, 1, 1, 2, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 1, 1, 2, 0, 1], [0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 1, 1, 1, 0, 0, 1, 0, 2, 0, 0, 0, 1], 100 * factorDeDificultad, 90 * factorDeDificultad, false);
				level.put("title", "Level 7");
				level.put("songLevel", "level7.song");
				level.put("background", "images/stage4/level7.jpg");
			}
			case 8: {
				level = new Level([0, 3, 1, 1, 1, 2, 0, 1, 1, 3, 0, 0, 3, 2, 1], [1, 0, 0, 1, 2, 1, 0, 2, 1, 1, 2, 0, 1], 120 * factorDeDificultad, 150 * factorDeDificultad, true);
				level.put("title", "Level 8");
				level.put("songLevel", "level8.song");
				level.put("background", "images/stage4/level8.jpg");
				level.setFlightInfo(new FlightInformation(new Point(340, 160), new Point(150, 260)));
			}
			case 9: {
				level = new Level([0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 2], [0, 2, 1], 40 * factorDeDificultad, 340 * factorDeDificultad, false);
				level.put("title", "Level 9");
				level.put("songLevel", "level9.song");
				level.put("background", "images/stage5/level9.jpg");
			}
			case 10: {
				level = new Level([0, 1, 0, 1, 0, 1, 0, 0, 2, 1, 0, 0, 0, 3, 1, 1], [0, 0, 1, 0, 2, 2], 75 * factorDeDificultad, 210 * factorDeDificultad, true);
				level.put("title", "Level 10");
				level.put("songLevel", "level10.song");
				level.put("background", "images/stage5/level10.jpg");
				level.setFlightInfo(new FlightInformation(new Point(190, 280), new Point(400, 230)));
			}
			case 11: {
				level = new Level([0, 1, 1, 2, 0, 1, 1, 1, 1, 2], [0, 1, 0, 0, 1, 0, 0, 0, 2, 0, 1], 120 * factorDeDificultad, 100 * factorDeDificultad, false);
				level.put("title", "Level 11");
				level.put("songLevel", "level11.song");
				level.put("background", "images/stage6/level11.jpg");
			}
			case 12: {
				level = new Level([0, 1, 1, 1, 1, 1, 2, 0, 2, 1, 1, 1, 2, 1], [0, 0, 1, 0, 3, 1, 2, 0, 0, 3], 130 * factorDeDificultad, 180 * factorDeDificultad, true);
				level.put("title", "Level 12");
				level.put("songLevel", "level12.song");
				level.put("background", "images/stage6/level12.jpg");
				level.setFlightInfo(new FlightInformation(new Point(190, 280), new Point(400, 230)));
			}
			case 13: {
				level = new Level([0, 2, 0, 1, 0, 1, 0, 1, 0, 3], [0, 0, 1, 0, 0, 0, 0, 2], 150 * factorDeDificultad, 150 * factorDeDificultad, false);
				level.put("title", "Level 13");
				level.put("songLevel", "level13.song");
				level.put("background", "images/stage7/level13.jpg");
			}
		}
	}

	public function getLevel(): Level {
		return level;
	}

	public function switchToNextLevel() {
		current++;
		if (current > _CANT_LEVELS) {
			factorDeDificultad *= 0.75;
			current -= _CANT_LEVELS;
		}
		loadLevel(current);
	}

}