import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/setting/domain/setting_domain_provider.dart';

import '../domain/setting_domain.dart';
import '../domain/value_objects/setting.dart';
import '../infrastructure/setting_storage_provider.dart';
import './setting_notifier.dart';

final settingProvider = StateNotifierProvider<SettingNotifier, Setting>((ref) {
  final settingDomain = ref.watch(settingDomainProvider);

  return SettingNotifier(settingDomain);
});
