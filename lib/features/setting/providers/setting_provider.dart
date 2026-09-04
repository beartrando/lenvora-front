import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/setting.dart';
import '../notifiers/setting_notifier.dart';

final settingProvider = AsyncNotifierProvider<SettingNotifier, Setting>(
  SettingNotifier.new,
);
