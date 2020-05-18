part of audio_player;

class WinInput implements IInput {
  static const String PIPE_NAME = r'\\.\pipe\mpg123_pipe';
  File _pipe;

  @override
  WinInput _write(String input) {
    print(_pipe);
    _pipe ??= File(PIPE_NAME);
    _pipe.writeAsStringSync(input);
    return this;
  } 

}