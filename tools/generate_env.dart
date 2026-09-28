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

void main() {
  for (final entry in environments.entries) {
    final variables = {
      ...base,
      ...entry.value,
    };

    final content = variables.entries
        .map((e) => '${e.key}=${e.value}')
        .join('\n');

    File('.env.${entry.key}').writeAsStringSync('$content\n');
  }
}