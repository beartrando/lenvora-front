import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/app/app_config.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  return AppConfig.fromEnv(dotenv.env);
});
