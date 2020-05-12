part of mpg123_player;

enum OsType {
  Windows,
  MacOS,
  Linux,
  Other
}

class Mpg123Controller {
  OsType _os;
  /// for *nix
  Stdin _in;
  /// for windows
  File _pipe;


  Mpg123Controller() {
    if (Platform.isWindows) {
      _os = OsType.Windows;
    } else if (Platform.isLinux) {
      _os = OsType.Linux;
    } else if (Platform.isMacOS) {
      _os = OsType.MacOS;
    } else {
      _os = OsType.Other;
    }
  }

  

  /// 写入进程
  Mpg123Controller _write(String input) {

    return this;
  }
}