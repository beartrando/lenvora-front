import '../storage/secure_storage.dart';
import './value_objects/device_id.dart';
import 'device_id_provider.dart';

class DeviceService {
  static const _deviceIdKey = 'device.id';

  final DeviceIdProvider _deviceIdProvider;
  final SecureStorage _storage;

  DeviceService({
    required DeviceIdProvider deviceIdProvider,
    required SecureStorage storage,
  }) : _deviceIdProvider = deviceIdProvider,
       _storage = storage;

  Future<DeviceId> getDeviceId() async {
    final stored = await _storage.read(_deviceIdKey);

    if (stored != null && stored.isNotEmpty) {
      return DeviceId(stored);
    }

    final deviceId = await _deviceIdProvider.getDeviceId();

    await _storage.save(_deviceIdKey, deviceId);

    return DeviceId(deviceId);
  }
}
