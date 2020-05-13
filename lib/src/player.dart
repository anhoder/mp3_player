part of mpg123_player;

class Player {
  /// mpg123 process
  Process _process;

  OsType _os;
  IInput _input;

  List<Song> _playlist;
  PlayMode _playMode;
  Song _curSong;
  Config _config;
  Downloader _downloader;
  Notifier _notifier;

  /// forbid new intance
  Player() {
    throw CannotInstantiateException(runtimeType.toString());
  }

  /// private method to new a instance
  Player._newInstance();

  /// start the player
  static Future<Player> start() async {
    var player = Player._newInstance();
    if (!player._checkEnv()) throw EnvInvalidException('Error: not found mpg123');
    player._checkOsType();

    player._playlist = [];

    if (player._os == OsType.Windows) {
      player._process = await Process.start('mpg123', ['-R --fifo ${WinInput.PIPE_NAME}']);
    } else {
      player._process = await Process.start('mpg123', ['-R']);
    }

    return player;
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

  Player play(dynamic songs) {
    // if (songs is String) _playlist.add(Song());
  }

  ///////// 方法
  // 播放 
  // 暂停
  // 继续
  // 切歌
  // 下一曲
  // 上一曲
  // 前进
  // 后退
  // 修改播放方式
  // 显示歌曲信息
  // 下载音歌曲
  // 歌词显示
  // 调节音量

}
