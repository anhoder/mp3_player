import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:mp3_player/audio_player.dart';

void main(List<String> args) async {
  stdin.echoMode = false;
  stdin.lineMode = false;

  var player = await Player.run();
  var dir = dirname(Platform.script.path);
  dir = Platform.isWindows ? dir.substring(1) : dir;
  var song = [
    join(dir, 'sample_mp3/a.mp3'),
    join(dir, 'sample_mp3/b.mp3'),
    join(dir, 'sample_mp3/c.mp3')
  ];
  player.play(song);

  var playing = true;
  stdin.transform(Utf8Decoder()).listen((inputKey) {
    switch (inputKey) {
      case ' ':
        playing ? player.pause() : player.resume();
        print(playing ? 'pause' : 'resume');
        playing = !playing;
        break;
      case '[':
        print('pre');
        player.pre();
        break;
      case ']':
        print('next');
        player.next();
        break;
      case ',':
        print('back');
        player.back();
        break;
      case '.':
        print('forward');
        player.forward();
        break;
      case '-':
        print('down volume');
        player.downVolume();
        break;
      case '=':
        print('up volume');
        player.upVolumne();
        break;
      case 'q':
        print('quit');
        player.quit();
        break;
    }
  });
}
