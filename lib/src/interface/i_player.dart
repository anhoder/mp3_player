part of mpg123_player;

abstract class IPlayer {
  IPlayer _newInstance();

  dynamic _start();

  dynamic _play(Song song);

  dynamic _pause();

  dynamic _resume();

  IPlayer start() {
    var player = _newInstance();
    player._start();

    return player;
  }
}