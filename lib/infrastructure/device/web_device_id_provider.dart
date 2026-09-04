import 'package:device_info_plus/device_info_plus.dart';

import 'device_id_provider.dart';

class WebDeviceIdProvider implements DeviceIdProvider {
  final DeviceInfoPlugin _deviceInfo;

  WebDeviceIdProvider({
    DeviceInfoPlugin? deviceInfo,
  }) : _deviceInfo = deviceInfo ?? DeviceInfoPlugin();

  @override
  Future<String> getDeviceId() async {
    final info = await _deviceInfo.webBrowserInfo;

    return info.userAgent;
  }
}