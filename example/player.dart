import 'dart:convert';
import 'dart:io';

import 'package:audio_player/audio_player.dart';

void main(List<String> args) async {
  stdin.echoMode = false;
  stdin.lineMode = false;


  var player = await Player.run();
  var song = [
    'example/sample_mp3/a.mp3',
    'example/sample_mp3/b.mp3',
    'example/sample_mp3/c.mp3'
  ];
  player.play(song);


  var playing = true;
  stdin.transform(Utf8Decoder()).listen((inputKey) {
    switch (inputKey) {
      case ' ':
        playing ? player.pause() : player.resume();
        playing = !playing;
        break;
      case '[':
        player.pre();
        break;
      case ']':
        player.next();
        break;
      case ',':
        player.back();
        break;
      case '.':
        player.forward();
        break;
      case '-':
        player.downVolume();
        break;
      case '=':
        player.upVolumne();
        break;
      case 'q':
        player.quit();
        break;
    }
  });
}
