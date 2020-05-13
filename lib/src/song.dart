part of mpg123_player;

class Song {
  String name;
  String singer;
  String album;
  int duration;
  String source;

  Song(String source, {this.name, this.singer, this.album, this.duration}) {
    var uri = Uri.tryParse(source);
    if (uri != null) {
      if (uri.scheme == 'http') {
        this.source = source;
      } else if (uri.scheme == 'https') {
        
      } else {

      }
    }
  }
}