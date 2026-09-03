import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:front/src/locale/environment_provider.dart';

class HttpConfig {
  final String host;
  final int port;

  // final Environment env;

  factory HttpConfig.fromEnv() {
    final host = dotenv.env['GATEWAY_HOST'] ?? 'localhost';
    final port = int.tryParse(dotenv.env['GATEWAY_PORT'] ?? '') ?? 9090;
    return HttpConfig(host: host, port: port);
  }

  const HttpConfig({required this.host, required this.port});
}
