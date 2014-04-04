package sound;

import flash.events.Event;

class Song extends MySound {

	public function new(songName:String) {
		super(songName);
	}

	override private function onSongEnd(event:Event) {
		super.onSongEnd(event);
		play();
	}

}