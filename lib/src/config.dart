part of mpg123_player;

enum ConfigType {
  OK_FLAG,
  OK_OPTION,
  DISCARDED
}

class Config {
  Map<String, String> configs;
  static const Map<String, ConfigType> _acceptConfigs = {
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
  };
}