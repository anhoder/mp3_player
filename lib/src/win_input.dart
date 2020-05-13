part of mpg123_player;

class WinInput implements IInput {
  static const String PIPE_NAME = '\\\\.\\pipe\\mpg123_player_pipe';
  final File _pipe;

  WinInput(): _pipe = File(PIPE_NAME);

  @override
  Future<File> _write(String input) => _pipe.writeAsString(input);

}