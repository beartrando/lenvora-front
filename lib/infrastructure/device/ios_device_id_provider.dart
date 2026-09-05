import 'package:device_info_plus/device_info_plus.dart';

import 'device_id_provider.dart';

class IosDeviceIdProvider implements DeviceIdProvider {
  final DeviceInfoPlugin _deviceInfo;

  IosDeviceIdProvider({DeviceInfoPlugin? deviceInfo})
    : _deviceInfo = deviceInfo ?? DeviceInfoPlugin();

  @override
  Future<String> getDeviceId() async {
    final info = await _deviceInfo.iosInfo;

    return info.identifierForVendor ?? '';
  }
}
