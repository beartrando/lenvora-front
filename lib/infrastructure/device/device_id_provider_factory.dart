import 'package:flutter/foundation.dart';
import 'package:front/infrastructure/device/providers/android_device_id_provider.dart';
import 'package:front/infrastructure/device/providers/device_id_provider.dart';
import 'package:front/infrastructure/device/providers/ios_device_id_provider.dart';
import 'package:front/infrastructure/device/providers/web_device_id_provider.dart';

DeviceIdProvider createDeviceIdProvider() {
  if (kIsWeb) {
    return WebDeviceIdProvider();
  }

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return AndroidDeviceIdProvider();

    case TargetPlatform.iOS:
      return IosDeviceIdProvider();

    default:
      throw UnsupportedError('Unsupported platform: $defaultTargetPlatform');
  }
}
