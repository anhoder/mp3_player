part of audio_player;

class OtherInput implements IInput {
  final IOSink _stdin;

  OtherInput(this._stdin);

  @override
  OtherInput _write(String input) {
    _stdin..write(input)
          ..flush();
    return this;
  }

}