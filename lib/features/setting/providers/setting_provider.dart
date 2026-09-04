import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/setting.dart';
import '../notifiers/setting_notifier.dart';

final settingProvider = StateNotifierProvider<SettingNotifier, Setting>((ref) {
  throw UnimplementedError();
});
