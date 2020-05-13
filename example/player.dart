import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

// import 'package:mpg123_player/mpg123_player.dart';

void main(List<String> args) async {
  // Player.start().then((player) {
  //   print(player);
  // });
  var process = await Process.start('mpg123', ['-']);
  var res = await Dio().get<ResponseBody>('https://m8.music.126.net/20200513234027/a8e8f3de6269b95144c267c9e5c12f10/ymusic/8972/6e6e/7b86/bddf788bf92e62d7c5c9aa457dd27bf5.mp3',
    options: Options(responseType: ResponseType.stream)
  );
  print(res.statusCode);
  // process.stdin.write('L');
  await process.stdin.addStream(res.data.stream);
  // process.stdin.write('\n');
}