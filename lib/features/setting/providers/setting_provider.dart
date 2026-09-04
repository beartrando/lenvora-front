import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/setting.dart';
import '../notifiers/setting_notifier.dart';
import './setting_service_provider.dart';
import './setting_state_provider.dart';

final settingProvider = StateNotifierProvider<SettingNotifier, Setting>((ref) {
  final setting = ref.watch(settingStateProvider).requireValue;
  final service = ref.watch(settingServiceProvider);

  return SettingNotifier(setting, service);
});
