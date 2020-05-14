part of audio_player;

class Song {
  String name;
  String singer;
  String album;
  int duration;
  String source;

  Song(this.source, {this.name, this.singer, this.album, this.duration});
}