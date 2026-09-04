import 'package:flutter/foundation.dart';

import 'android_device_id_provider.dart';
import 'device_id_provider.dart';
import 'ios_device_id_provider.dart';
import 'web_device_id_provider.dart';

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
      throw UnsupportedError(
        'Unsupported platform: $defaultTargetPlatform',
      );
  }
}
