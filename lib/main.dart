import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app.dart';
import 'package:front/features/setting/domain/setting_domain.dart';
import 'package:front/features/setting/domain/setting_domain_provider.dart';
import 'package:front/features/setting/infrastructure/setting_storage.dart';
import 'package:front/features/setting/infrastructure/setting_storage_provider.dart';
import 'package:front/infrastructure/auth/auth_service_provider.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final logger = Logger();

Future<void> main() async {
  FlutterError.onError = _handleFlutterError;

  runZonedGuarded(() async {
    await _bootstrapFlutter();

    final container = await _initRiverpodContainer();

    runApp(
      UncontrolledProviderScope(container: container, child: const MyApp()),
    );
  }, _handleAsyncError);
}

void _handleFlutterError(FlutterErrorDetails details) {
  FlutterError.dumpErrorToConsole(details);
  debugPrint(
    'Flutter error: \${details.exceptionAsString()}\n\${details.stack}',
  );
  logger.e(
    'Flutter error',
    error: details.exception,
    stackTrace: details.stack,
  );
}

void _handleAsyncError(Object error, StackTrace stack) {
  debugPrint('Uncaught async error: $error\\n$stack');
  logger.e('Async error', error: error, stackTrace: stack);
}

Future<void> _bootstrapFlutter() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: '.env');
}

Future<ProviderContainer> _initRiverpodContainer() async {
  final preferences = await SharedPreferences.getInstance();

  final settingStorage = SettingStorage(preferences);
  final setting = await settingStorage.load();
  final settingDomain = SettingDomain(setting);

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(preferences),

      settingDomainProvider.overrideWithValue(settingDomain),
    ],
  );

  final authService = container.read(authServiceProvider);
  await authService.getOrCreateAccessToken();

  // final authService = container.read(authServiceProvider);
  // await authService.getOrCreateJwt();

  return container;
}
