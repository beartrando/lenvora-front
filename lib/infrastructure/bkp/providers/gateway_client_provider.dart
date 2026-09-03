import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/src/api/gateway_client.dart';
import 'package:front/src/config/http_config.dart';
import 'package:logger/logger.dart';

final logger = Logger();

final gatewayClientProvider = Provider<GatewayClient>((ref) {
  final config = GatewayConfig.fromEnv();
  ;
  logger.i(config);
  logger.i('Init started with app: $config');

  final gatewayClient = GatewayClient(config);

  return gatewayClient;
});
