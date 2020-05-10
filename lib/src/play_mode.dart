part of mpg123_player;

enum PlayMode {
  LIST_LOOP,   
  SINGLE_LOOP, 
  RANDOM,     
  SEQUENTIAL,   
  INTELLIGENT
}

const PLAY_MODE_NAMES = <PlayMode, String>{
  PlayMode.LIST_LOOP: '列表循环',
  PlayMode.SINGLE_LOOP: '单曲循环',
  PlayMode.RANDOM: '随机播放',
  PlayMode.SEQUENTIAL: '顺序播放',
  PlayMode.INTELLIGENT: '心动模式'
};