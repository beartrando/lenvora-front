import 'dart:io';

const baseEnvPath = './env/.env.base';

const base = {
  'ENV': 'dev',

  'GATEWAY_HOST': '192.168.31.186',
  'GATEWAY_PORT': '9090',

  'STREAMING_HOST': '192.168.31.186',
  'STREAMING_PORT': '8080',
};

const environments = {
  'dev': {
    'GATEWAY_HOST': '31.222.235.64',
  },
  'uat': {
    'GATEWAY_HOST': '31.222.235.64',
  },
  'prod': {
    'ENV': 'production',
    'GATEWAY_HOST': '31.222.235.64',
  },
};


Map<String, String> readEnv(String path) {
  final file = File(path);

  if (!file.existsSync()) {
    return {};
  }

  return Map.fromEntries(
    file
        .readAsLinesSync()
        .where((line) {
      final trimmed = line.trim();
      return trimmed.isNotEmpty && !trimmed.startsWith('#');
    })
        .map((line) {
      final index = line.indexOf('=');

      if (index == -1) {
        return null;
      }

      return MapEntry(
        line.substring(0, index).trim(),
        line.substring(index + 1).trim(),
      );
    })
        .whereType<MapEntry<String, String>>(),
  );
}

void writeEnv(String filename, Map<String, String> variables) {
  final content = variables.entries
      .map((e) => '${e.key}=${e.value}')
      .join('\n');

  File(filename).writeAsStringSync('$content\n');
}

void main() {
  final baseEnv = readEnv(baseEnvPath);

  print('base: $baseEnv');

  final actualBase = {
    ...base,
    ...baseEnv,
  };

  writeEnv('.env', actualBase);

  for (final entry in environments.entries) {
    final variables = {
      ...actualBase,
      ...entry.value,
    };

    writeEnv('.env.${entry.key}', variables);
  }
}