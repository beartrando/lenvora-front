import 'dart:io';

const baseOveridesEnvPath = './env/.env';
const baseEnvPath = './env/.env.dist';
const environmentPrefix = './env/.env.';
const environmentsList = ['dev', 'uat', 'prod'];



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
  final file = File(filename);

  if (file.existsSync()) {
    print('Skipped: $filename already exists');
    return;
  }

  final content = variables.entries
      .map((e) => '${e.key}=${e.value}')
      .join('\n');

  File(filename).writeAsStringSync('$content\n');

  print('Created: $filename');
}

void main() {
  final baseEnv = readEnv(baseEnvPath);
  final baseOveridenEnv = readEnv(baseOveridesEnvPath);

  final actualBase = {
    ...baseEnv,
    ...baseOveridenEnv,
  };

  writeEnv('.env', actualBase);

  for (final environment in environmentsList) {

    final envValue = readEnv(environmentPrefix + environment);

    final variables = {
      ...actualBase,
      ...envValue,
    };

    writeEnv('.env.${environment}', variables);
  }
}
