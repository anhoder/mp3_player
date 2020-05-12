import 'dart:io';

import 'package:mpg123_player/mpg123_player.dart';

void main(List<String> args) {
  Player.start().then((player) {
    print(player);
  });
  var file = File('\\\\.\\pipe\\pipename');
  file.writeAsStringSync('L C:/Users/Alan/Desktop/a.mp3\n', flush: true);
  
}