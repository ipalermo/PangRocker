package sound;


class SoundManager {

	private static var _INSTANCE: SoundManager;

	private var songs: Map<String, MySound>;

	public static function getInstance() {
		if (_INSTANCE == null)
			_INSTANCE = new SoundManager();
		return _INSTANCE;
	}

	private function new() {
		songs = new Map<String, MySound>();
		loadsongs();
	}

	private function loadsongs() {
		songs.set("soundshoot", new MySound("burbuja"));
		songs.set("guitar1", new MySound("guitar1"));
		songs.set("guitar2", new MySound("guitar2"));
		songs.set("celebrating", new MySound("celebrating"));
		songs.set("gameover", new MySound("gameover")); 
		songs.set("loseLife", new MySound("loseLife"));
		songs.set("plane", new MySound("plane"));

		songs.set("presentation.song", new MySound("intro"));
		songs.set("level1.song", new Song("Divina TV Fuhrer"));
		songs.set("level2.song", new Song("Sabado"));
		songs.set("level3.song", new Song("Wellcome to the Jungle"));
		songs.set("level4.song", new Song("Enter Sandman"));
		songs.set("level5.song", new Song("Highway to Hell"));
		songs.set("level6.song", new Song("Suicide Blonde"));
		songs.set("level7.song", new Song("Mixed Emotions"));
		songs.set("level8.song", new Song("Elevation"));
		songs.set("level9.song", new Song("Her We Kum"));
		songs.set("level10.song", new Song("Dejate Caer"));
		songs.set("level11.song", new Song("El Rastro"));
		songs.set("level12.song", new Song("Virus"));
		songs.set("level13.song", new Song("On the Run"));
		
		/*songs.set("transition.song", new Song("intro.mp3"));*/
	}

	public function playSong(songName: String) {
		var s : MySound = songs.get(songName);
		if (s != null)
			s.play();
	}

	public function stopSong(songName: String) {
		var s : MySound = songs.get(songName);
		if (s != null)
			s.stop();
	}

}