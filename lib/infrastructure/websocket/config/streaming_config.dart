import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front/infrastructure/websocket/config/websocket_config.dart';


class StreamingConfig implements WebsocketConfig {
  @override
  final String host;

  @override
  final int port;

  const StreamingConfig({required this.host, required this.port});

  factory StreamingConfig.fromEnv() {
    return StreamingConfig(
      host: dotenv.env['STREAMING_HOST'] ?? 'localhost',
      port: int.tryParse(dotenv.env['STREAMING_PORT'] ?? '') ?? 8080,
    );
  }
}
