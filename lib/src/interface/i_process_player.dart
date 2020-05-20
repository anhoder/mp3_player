part of audio_player;

abstract class IProcessPlayer {

  dynamic _run();

  dynamic _pause();

  dynamic _resume();

  dynamic _play(ISong song);

  dynamic _load(ISong song);

  dynamic _jump({int seconds, int frame, bool offset = false});

  dynamic _stop();

  dynamic _quit();

  dynamic _tuneSpeed(int speed, [bool offset = false]);

  dynamic _upVolume(int delta);

  dynamic _downVolume(int delta);

  Stream<Map<String, String>> _getMusicInfo();

  Stream<Map<String, double>> _getProgress();

  Stream<int> _getStatus();

  Stream<String> _getError();
}