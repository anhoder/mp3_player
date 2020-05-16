
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audio_player/audio_player.dart';

void main(List<String> args) async {
  var player = await Player.run();
  var song = Platform.isWindows ? 'C:/Users/Alan/Desktop/a.mp3' : '/mnt/c/Users/Alan/Desktop/a.mp3';
  player.play(song);
}
