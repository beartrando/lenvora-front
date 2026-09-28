import 'dart:io';

const base = {
  'ENV': 'dev',

  'GATEWAY_HOST': '192.168.31.186',
  'GATEWAY_PORT': '9090',

  'STREAMING_HOST': '192.168.31.186',
  'STREAMING_PORT': '8080',

  'MOVE_TIMEOUT': '20',
};

const environments = {
  'dev': {
    'GATEWAY_HOST': '31.222.235.64',
    'STREAMING_HOST': '31.222.235.64',
  },
  'uat': {
    'ENV': 'dev',
    'GATEWAY_HOST': '31.222.235.64',
    'STREAMING_HOST': '31.222.235.64',
  },
  'prod': {
    'ENV': 'dev',
    'GATEWAY_HOST': '31.222.235.64',
    'STREAMING_HOST': '31.222.235.64',
  },
};

void writeEnv(String filename, Map<String, String> variables) {
  final content = variables.entries
      .map((e) => '${e.key}=${e.value}')
      .join('\n');

  File(filename).writeAsStringSync('$content\n');
}

void main() {
  writeEnv('.env', base);

  for (final entry in environments.entries) {
    final variables = {
      ...base,
      ...entry.value,
    };

    writeEnv('.env.${entry.key}', variables);
  }
}