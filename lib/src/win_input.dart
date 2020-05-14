part of audio_player;

class WinInput implements IInput {
  static const String PIPE_NAME = r'\\.\pipe\pipename';
  final File _pipe;

  WinInput(): _pipe = File(PIPE_NAME);

  @override
  Future<File> _write(String input) => _pipe.writeAsString(input);

}