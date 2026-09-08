import 'package:device_info_plus/device_info_plus.dart';

import 'device_id_provider.dart';

class AndroidDeviceIdProvider implements DeviceIdProvider {
  final DeviceInfoPlugin _deviceInfo;

  AndroidDeviceIdProvider({DeviceInfoPlugin? deviceInfo})
    : _deviceInfo = deviceInfo ?? DeviceInfoPlugin();

  @override
  Future<String> getDeviceId() async {
    final info = await _deviceInfo.androidInfo;

    return info.id;
  }
}
