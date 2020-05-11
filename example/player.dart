import 'package:mpg123_player/mpg123_player.dart';

void main(List<String> args) {
  Player.start().then((player) {
    print(player);
  });
}