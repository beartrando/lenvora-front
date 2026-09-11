import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:logger/logger.dart';

class AppUpdateService {
  final Logger logger;

  AppUpdateService(this.logger);

  Future<void> checkAndUpdate() async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      await _checkAndroidUpdate();
    }
  }

  Future<void> _checkAndroidUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        await InAppUpdate.performImmediateUpdate();
      }
    } catch (error, stackTrace) {
      logger.e('App update check failed', error: error, stackTrace: stackTrace);
    }
  }
}
