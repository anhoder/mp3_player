
import 'dart:io';

import 'package:audio_player/audio_player.dart';

void main(List<String> args) async {
  // var player = await Player.run();
  // player.play('/mnt/c/Users/Alan/Desktop/a.mp3');
  var process = await Process.start('mpg123', ['--fifo \\\\.\\pipe\\pipename', '-R'], runInShell: true);
  sleep(Duration(seconds: 5));
  var file = File('\\\\.\\pipe\\pipename');
  file.writeAsStringSync('L C:/Users/Alan/Desktop/a.mp3\n');
}