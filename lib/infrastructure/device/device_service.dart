import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class DeviceService {
  static const _deviceIdKey = 'device.id';
  final DeviceInfoPlugin _deviceInfo;
  final SecureStorage _storage;
  final Uuid _uuid;

  DeviceService({
    DeviceInfoPlugin? deviceInfo,
    required SecureStorage storage,
    Uuid? uuid,
  }) : _deviceInfo = deviceInfo ?? DeviceInfoPlugin(),
       _storage = storage,
       _uuid = uuid ?? const Uuid();

  Future<String> getDeviceId() async {
    final stored = await _storage.read(_deviceIdKey);

    if (stored != null && stored.isNotEmpty) {
      return stored;
    }

    final deviceId = await _generateDeviceId();

    await _storage.save(_deviceIdKey, deviceId);

    return deviceId;
  }

  Future<String> _generateDeviceId() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return info.id;
    }

    if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return info.identifierForVendor ?? '';
    }

    return _uuid.v4();
  }
}
