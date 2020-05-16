part of audio_player;

class Mpg123Monitor<List> implements StreamConsumer<List> {

  Mpg123Player _player;
  int _loop_count = 0;

  Mpg123Monitor(this._player);

  void _handle(String data) {
    // TODO
    var items = data.split(' ');
    if (items.isEmpty) return;
    switch (items[0]) {
      case '@F':
      case '@E':
      case '@P':
      case '':
        _loop_count++;
        if (_loop_count > 100) break;
    }
  }

  @override
  Future addStream(Stream stream) {
    var completer = Completer();
    stream.transform(Utf8Decoder())
          .transform(LineSplitter())
          .listen((data) {
      _handle(data);
    }, onError: completer.completeError,
       onDone: completer.complete,
       cancelOnError: true);
    return completer.future;
  }

  @override
  Future close() => Future.value();

}