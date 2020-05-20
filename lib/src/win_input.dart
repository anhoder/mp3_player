part of audio_player;

class WinInput implements IInput {
  static const String PIPE_NAME = r'\\.\pipe\mpg123_pipe';
  File _pipe;

  @override
  WinInput _write(String input) {
    try {
      _pipe ??= File(PIPE_NAME);
      _pipe.writeAsStringSync(input, flush: true);
      return this;
    } catch (e) {
      sleep(Duration(milliseconds: 200));
      return _write(input);
    }
  }
}
