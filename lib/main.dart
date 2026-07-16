import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app.dart';
import 'package:logger/logger.dart';

final logger = Logger();

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);

    debugPrint(
      'Flutter error: ${details.exceptionAsString()}\n${details.stack}',
    );

    logger.e(
      'Flutter error',
      error: details.exception,
      stackTrace: details.stack,
    );
  };

  runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      await dotenv.load(fileName: '.env');

      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
        (error, stack) {
      debugPrint('Uncaught async error: $error\n$stack');

      logger.e(
        'Async error',
        error: error,
        stackTrace: stack,
      );
    },
  );
}