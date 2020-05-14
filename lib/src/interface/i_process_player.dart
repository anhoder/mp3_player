part of audio_player;

abstract class IProcessPlayer {

  dynamic _run();

  dynamic _pause();

  dynamic _resume();

  dynamic _play(Song song);
}