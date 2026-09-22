import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:front/infrastructure/error/error_reporter.dart';

class FirebaseErrorReporter implements ErrorReporter {
  FirebaseErrorReporter();

  final _crashlytics = FirebaseCrashlytics.instance;

  @override
  void fatal(Object error, StackTrace stack) {
    _crashlytics.recordError(
      error,
      stack,
      fatal: true,
    );
  }

  @override
  void report(Object error, StackTrace stack) {
    _crashlytics.recordError(
      error,
      stack,
    );
  }
}
