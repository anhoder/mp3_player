# mp3_player

![GitHub repo size](https://img.shields.io/github/repo-size/AlanAlbert/mp3_player)
![GitHub](https://img.shields.io/github/license/AlanAlbert/mp3_player)
![Last Tag](https://badgen.net/github/tag/AlanAlbert/mp3_player)
![GitHub last commit](https://badgen.net/github/last-commit/AlanAlbert/mp3_player)

![Support](https://badgen.net/pub/dart-platform/mp3_player)
![Pub Version](https://img.shields.io/pub/v/mp3_player)


![GitHub stars](https://img.shields.io/github/stars/AlanAlbert/mp3_player?style=social)
![GitHub forks](https://img.shields.io/github/forks/AlanAlbert/mp3_player?style=social)

A library for play mp3 file in ternimal, and it is based on mpg123.

## Usage

1. add dependency in `pubspec.yaml`.

2. then, you can use it in your code:

```dart
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

```


## Method

```dart
Player play([dynamic songs]);
Player addSong(dynamic songs);
Player pause();
Player resume();
Player next();
Player pre();
Player forward({int seconds = 5, int frame});
Player back({int seconds = 5, int frame});
Player upVolumne([int delta = 10]);
Player downVolume([int delta = 10]);
void quit();
```