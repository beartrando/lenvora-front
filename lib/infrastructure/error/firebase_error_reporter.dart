import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:front/infrastructure/error/error_reporter.dart';

class FirebaseErrorReporter implements ErrorReporter {
  FirebaseErrorReporter({FirebaseCrashlytics? crashlytics})
    : _crashlytics = crashlytics ?? FirebaseCrashlytics.instance;

  final FirebaseCrashlytics _crashlytics;

  @override
  void fatal(Object error, StackTrace stack) {
    unawaited(_crashlytics.recordError(error, stack, fatal: true));
  }

  @override
  void report(Object error, StackTrace stack) {
    unawaited(_crashlytics.recordError(error, stack));
  }
}
