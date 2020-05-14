part of audio_player;

class Mpg123Player implements IProcessPlayer {
  Process _process;
  OsType _os;
  IInput _input;
  Config _config;

  Mpg123Player([this._config]) {
    if (!_checkEnv()) throw EnvInvalidException('Error: not found mpg123');
    _config ??= Config();
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
    if (_os == OsType.Windows) {
      _process = await Process.start('mpg123', ['--fifo ${WinInput.PIPE_NAME} -R']);
    } else {
      _process = await Process.start('mpg123', ['-R']);
    }
    _checkOsType();
  }

  @override
  Mpg123Player _play(Song song) {
    _input._write('L ${song.source}\n');
    return this;
  }

  @override
  _pause() {
    // TODO: implement _pause
    return null;
  }

  @override
  _resume() {
    // TODO: implement _resume
    return null;
  }

}