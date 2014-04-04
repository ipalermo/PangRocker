package sound;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.events.Event;
import openfl.Assets;

class MySound {

	private var song : Sound;
	private var channel : SoundChannel;
	private var playing : Bool;

	public function new(songName:String) {
		song = Assets.getSound(songName);
		playing = false;
	}

	public function play() {
		if (!playing) {
			channel = song.play();
			channel.addEventListener(Event.SOUND_COMPLETE, onSongEnd);
			playing = true;
		}
	}

	public function stop() {
		channel.stop();
		playing = false;
	}

	private function onSongEnd(event:Event) {
		playing = false;
	}

}