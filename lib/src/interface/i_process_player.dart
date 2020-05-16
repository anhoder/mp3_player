part of audio_player;

abstract class IProcessPlayer {

  dynamic _run();

  dynamic _pause();

  dynamic _resume();

  dynamic _play(ISong song);

  dynamic _stop();

  dynamic _quit();

  dynamic _upVolume(int delta);

  dynamic _downVolume(int delta);
}