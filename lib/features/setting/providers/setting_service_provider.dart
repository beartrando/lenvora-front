import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/setting_service.dart';

final settingServiceProvider = Provider<SettingService>((ref) {
  return SettingService();
});
