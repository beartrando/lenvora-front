import 'package:front/infrastructure/device/providers/device_id_provider.dart';
import 'package:uuid/uuid.dart';

class WebDeviceIdProvider implements DeviceIdProvider {
  final Uuid _uuid;

  WebDeviceIdProvider({Uuid? uuid}) : _uuid = uuid ?? const Uuid();

  @override
  Future<String> getDeviceId() async {
    return _uuid.v4();
  }
}
