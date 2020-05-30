part of audio_player;

class Mpg123Monitor<T> implements StreamConsumer<T> {
  int _loop_count = 0;
  final StreamController<Map<String, double>> _progressController;
  final StreamController<Map<String, String>> _infoController;
  final StreamController<String> _errorController;
  final StreamController<int> _statusController;

  String _title;
  String _artist;
  String _album;
  String _year;
  String _comment;
  String _genre;
  String _track;

  Mpg123Monitor()
      : _progressController = StreamController(),
        _infoController = StreamController(),
        _errorController = StreamController(),
        _statusController = StreamController();

  void _handle(String data) {
    if (data.length < 2) return;
    var type = data.substring(0, 2);
    switch (type) {
      // music info
      case '@I':
        if (data.length < 7) break;
        var substr = data.substring(3, 7);
        switch (substr) {
          case 'ID3:':
            var info = data.substring(7);
            _title = info.length >= 30 ? info.substring(0, 30) : '';
            _artist = info.length >= 60 ? info.substring(30, 60) : '';
            _album = info.length >= 90 ? info.substring(60, 90) : '';
            _year = info.length >= 94 ? info.substring(90, 94) : '';
            _comment = info.length >= 124 ? info.substring(94, 124) : '';
            _genre = info.length > 124 ? info.substring(124) : '';
            break;
          case 'ID3.':
          case 'ID3v':
            var info = data.substring(data.indexOf('.') + 1).split(':');
            if (info[0] == 'title') {
              _title = info[1];
            } else if (info[0] == 'artist') {
              _artist = info[1];
            } else if (info[0] == 'album') {
              _album = info[1];
            } else if (info[0] == 'genre') {
              _genre = info[1];
            } else if (info[0] == 'track') {
              _track = info[1];
            }
            break;
        }
        _infoController.add(<String, String>{
          'title': _title ?? '',
          'artist': _artist ?? '',
          'album': _album ?? '',
          'year': _year ?? '',
          'comment': _comment ?? '',
          'genre': _genre ?? '',
          'track': _track ?? ''
        });
        break;
      // frame info
      case '@F':
        var items = data.split(' ');
        _progressController.add(<String, double>{
          'cur': double.parse(items[3]),
          'left': double.parse(items[4])
        });
        break;
      // error message
      case '@E':
        var items = data.split(' ');
        _errorController.add(items[1] ?? '');
        break;
      // status
      case '@P':
        var items = data.split(' ');
        _statusController.add(int.parse(items[1]));
        break;
      // stream info
      // case '@S':
      case '':
        _loop_count++;
        if (_loop_count > 100) break;
    }
  }

  @override
  Future addStream(Stream stream) {
    var completer = Completer();
    stream.transform(Utf8Decoder(allowMalformed: true)).transform(LineSplitter()).listen((data) {
      _handle(data);
    },
        onError: completer.completeError,
        onDone: completer.complete,
        cancelOnError: true);
    return completer.future;
  }

  @override
  Future close() {
    _progressController.close();
    _infoController.close();
    _errorController.close();
    _statusController.close();
    return Future.value();
  }

  Stream<Map<String, double>> _getProgress() => _progressController.stream;

  Stream<Map<String, String>> _getMusicInfo() => _infoController.stream;

  Stream<String> _getError() => _errorController.stream;

  Stream<int> _getStatus() => _statusController.stream;
}
