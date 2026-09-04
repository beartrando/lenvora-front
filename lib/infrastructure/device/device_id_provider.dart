import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'device_id_provider_factory.dart';

abstract interface class DeviceIdProvider {
  Future<String> getDeviceId();
}

final deviceIdProvider = Provider<DeviceIdProvider>((ref) {
  return createDeviceIdProvider();
});