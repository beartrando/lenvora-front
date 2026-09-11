import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/device/device_service.dart';
import 'package:front/infrastructure/device/providers/device_id_provider.dart';
import 'package:front/infrastructure/storage/secure_storage_provider.dart';

final deviceServiceProvider = Provider<DeviceService>((ref) {
  return DeviceService(
    deviceIdProvider: ref.watch(deviceIdProvider),
    storage: ref.watch(secureStorageProvider),
  );
});
