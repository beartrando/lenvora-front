import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  final DeviceInfoPlugin _deviceInfo;

  DeviceService({DeviceInfoPlugin? deviceInfo})
    : _deviceInfo = deviceInfo ?? DeviceInfoPlugin();

  Future<String> getDeviceId() async {
    final deviceInfo = await _deviceInfo.deviceInfo;

    return deviceInfo.data['id']?.toString() ?? '';
  }
}
