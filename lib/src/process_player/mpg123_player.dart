part of audio_player;

class Mpg123Player implements IProcessPlayer {
  Process _process;
  OsType _os;
  IInput _input;
  Config _config;
  int _volume;
  bool _isPlaying;
  Mpg123Monitor<List<int>> _monitor;

  Mpg123Player([this._config]): _isPlaying = false {
    if (!_checkEnv()) throw EnvInvalidException('Error: not found mpg123');
    _config ??= Config();
    _monitor = Mpg123Monitor<List<int>>();
  }

  /// check runtime environment
  bool _checkEnv() {
    try {
      var result = Process.runSync('mpg123', ['--version']);
      if (result.exitCode != 0) return false;
    } catch (e) {
      return false;
    }
    return true;
  }

  /// check system
  void _checkOsType() {
    if (Platform.isWindows) {
      _os = OsType.Windows;
      _input = WinInput();
    } else if (Platform.isLinux) {
      _os = OsType.Linux;
      _input = OtherInput(_process.stdin);
    } else if (Platform.isMacOS) {
      _os = OsType.MacOS;
      _input = OtherInput(_process.stdin);
    } else {
      _os = OsType.Other;
      _input = OtherInput(_process.stdin);
    }
  }

  @override
  Future _run() async {
    if (Platform.isWindows) {
      _process = await Process.start('mpg123', ['--fifo', WinInput.PIPE_NAME, '-R']);
    } else {
      _process = await Process.start('mpg123', ['-R']);
    }
    _checkOsType();
    _process.stdout.pipe(_monitor);
  }

  @override
  Future<Mpg123Player> _play(ISong song) async {
    _input._write('L ${song.source}\n');
    return this;
  }

  @override
  Mpg123Player _stop() {
    _input._write('S\n');
    return this;
  }

  @override
  Mpg123Player _upVolume(int delta) => _tuneVolume(delta, true);

  @override
  Mpg123Player _downVolume(int delta) => _tuneVolume(delta, false);

  Mpg123Player _tuneVolume(int delta, [bool isUp = true]) {
    _volume = isUp ? _volume + delta : _volume - delta;
    if (_volume > 100) {
      _volume = 100;
    } else if (_volume < 0) {
      _volume = 0;
    }

    _input._write('V ${_volume}\n');

    return this;
  }


  @override
  Stream<Map<String, String>> _getMusicInfo() => _monitor._getMusicInfo();

  @override
  Stream<Map<String, double>> _getProgress() => _monitor._getProgress();

  @override
  Stream<int> _getStatus() => _monitor._getStatus();

  @override
  Stream<String> _getError() => _monitor._getError();

  @override
  Mpg123Player _pause() {
    _input._write('P\n');
    return this;
  }

  @override
  _resume() {
    // TODO: implement _resume
    return null;
  }

  _loadFile() {

  }

  @override
  _quit() {
    _input._write('Q\n');
    _process.kill();
  }

}