part of audio_player;

class Player {

  List<ISong> _playlist;
  PlayMode _playMode;
  ISong _curSong;
  Downloader _downloader;
  Notifier _notifier;
  IProcessPlayer _player;

  /// forbid new intance
  Player() {
    throw CannotInstantiateException(runtimeType.toString());
  }

  /// private method to new a instance
  Player._newInstance(): _playlist = [];
  
  
  static Future<Player> run([IProcessPlayer processPlayer]) async {
    var player = Player._newInstance();
    player._player = processPlayer ?? Mpg123Player();
    await player._player._run();
    return player;
  }


  Player play([dynamic songs]) {
    if (songs != null) {
      if (songs is String) {
        _playlist.add(Song.fromString(songs));
      } else if (songs is ISong) {
        _playlist.add(songs);
      } else if (songs is List<ISong>) {
        _playlist.addAll(songs);
      } else if (songs is List<String>) {
        songs.forEach((song) => _playlist.add(Song.fromString(song)));
      } else {
        throw DataTypeInvalidException(songs.toString());
      }
    }
  
    _player._play(_playlist.first);
    

    return this;
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
