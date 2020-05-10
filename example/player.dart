import '../lib/mpg123_player.dart';

void main(List<String> args) {
  Player.start().then((player) {
    print(player);
  });
}