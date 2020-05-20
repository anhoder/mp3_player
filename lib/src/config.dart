part of audio_player;

enum ConfigType { OK_FLAG, OK_OPTION, DISCARDED }

const Map<String, ConfigType> _acceptedConfigs = {
  '-k': ConfigType.OK_OPTION,
  '--skip': ConfigType.OK_OPTION,
  '-n': ConfigType.OK_OPTION,
  '-frames': ConfigType.OK_OPTION,
  '--fuzzy': ConfigType.OK_FLAG,
  '-y': ConfigType.OK_FLAG,
  '--no-resync': ConfigType.OK_FLAG,
  '--resync-limit': ConfigType.OK_OPTION,
  '-p': ConfigType.OK_OPTION,
  '-proxy': ConfigType.OK_OPTION,
  '-u': ConfigType.OK_OPTION,
  '--auth': ConfigType.OK_OPTION,
  '--continue': ConfigType.OK_FLAG,
  '--loop': ConfigType.OK_OPTION,
  '--timeout': ConfigType.OK_OPTION,
  '-z': ConfigType.OK_FLAG,
  '--shuffle': ConfigType.OK_FLAG,
  '-Z': ConfigType.OK_FLAG,
  '--random': ConfigType.OK_FLAG,
  '--no-icy-meta': ConfigType.OK_FLAG,
  '-i': ConfigType.OK_FLAG,
  '--index': ConfigType.OK_FLAG,
  '--index-size': ConfigType.OK_OPTION,
  '--preframes': ConfigType.OK_OPTION,
  '-o': ConfigType.OK_OPTION,
  '--output': ConfigType.OK_OPTION,
  '-a': ConfigType.OK_OPTION,
  '--audiodevice': ConfigType.OK_OPTION,
  '-s': ConfigType.OK_FLAG,
  '--stdout': ConfigType.OK_FLAG,
  '-O': ConfigType.OK_OPTION,
  '--outfile': ConfigType.OK_OPTION,
  '-w': ConfigType.OK_OPTION,
  '--wav': ConfigType.OK_OPTION,
  '--au': ConfigType.OK_OPTION,
  '--cdr': ConfigType.OK_OPTION,
  '--reopen': ConfigType.OK_FLAG,
  '--cpu': ConfigType.OK_OPTION,
  '-g': ConfigType.OK_OPTION,
  '--gain': ConfigType.OK_OPTION,
  '-f': ConfigType.OK_OPTION,
  '--scale': ConfigType.OK_OPTION,
  '--rva-mix': ConfigType.OK_FLAG,
  '--rva-radio': ConfigType.OK_FLAG,
  '--rva-album': ConfigType.OK_FLAG,
  '--rva-audiophile': ConfigType.OK_FLAG,
  '-0': ConfigType.OK_FLAG,
  '--single0': ConfigType.OK_FLAG,
  '-1': ConfigType.OK_FLAG,
  '--single1': ConfigType.OK_FLAG,
  '-m': ConfigType.OK_FLAG,
  '--mono': ConfigType.OK_FLAG,
  '--mix': ConfigType.OK_FLAG,
  '--singlemix': ConfigType.OK_FLAG,
  '--stereo': ConfigType.OK_FLAG,
  '-r': ConfigType.OK_OPTION,
  '--rate': ConfigType.OK_OPTION,
  '-2': ConfigType.OK_FLAG,
  '--2to1': ConfigType.OK_FLAG,
  '-4': ConfigType.OK_FLAG,
  '--4to1': ConfigType.OK_FLAG,
  '--pitch': ConfigType.OK_OPTION,
  '--8bit': ConfigType.OK_FLAG,
  '--float': ConfigType.OK_FLAG,
  '-e': ConfigType.OK_OPTION,
  '--encoding': ConfigType.OK_OPTION,
  '-d': ConfigType.OK_OPTION,
  '--doublespeed': ConfigType.OK_OPTION,
  '-h': ConfigType.OK_OPTION,
  '--halfspeed': ConfigType.OK_OPTION,
  '-E': ConfigType.OK_OPTION,
  '--equalizer': ConfigType.OK_OPTION,
  '--gapless': ConfigType.OK_FLAG,
  '--no-gapless': ConfigType.OK_FLAG,
  '-D': ConfigType.OK_OPTION,
  '--delay': ConfigType.OK_OPTION,
  '-o h': ConfigType.OK_FLAG,
  '--headphones': ConfigType.OK_FLAG,
  '-o s': ConfigType.OK_FLAG,
  '--speaker': ConfigType.OK_FLAG,
  '-o l': ConfigType.OK_FLAG,
  '--lineout': ConfigType.OK_FLAG,
  '-b': ConfigType.OK_OPTION,
  '--buffer': ConfigType.OK_OPTION,
  '--preload': ConfigType.OK_OPTION,
  '--smooth': ConfigType.OK_FLAG,
  '--title': ConfigType.OK_FLAG,
};

class Config {
  Map<String, String> _configs;

  Config([this._configs]) {
    _configs ??= {};
  }

  Config addAcceptedConfig(String key, ConfigType type) {
    if (_acceptedConfigs.containsKey(key)) throw KeyExistsException(key);
    _acceptedConfigs[key] = type;
    return this;
  }

  Config addConfigValue(String key, String value) {
    _configs[key] = value;
    return this;
  }

  String getConfigValue(String key) {
    if (!_configs.containsKey(key)) return null;
    return _configs[key];
  }

  Config reset() {
    _configs.clear();
    return this;
  }
}
