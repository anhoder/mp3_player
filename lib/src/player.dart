part of mpg123_player;

class Player {
  /// mpg123 process
  Process _process;

  SongList _playlist;
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

    player._process = await Process.start('mpg123', ['-R']);

    // player._process.stdin.write('L /mnt/c/Users/Alan/Desktop/a.mp3\n');
    // await player._process.stdin.flush();

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

  // 方法
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