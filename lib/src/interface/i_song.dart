part of audio_player;

abstract class ISong {
  String get name;
  String get singer;
  String get album;
  int get duration;
  String get source;

  ISong();
}
