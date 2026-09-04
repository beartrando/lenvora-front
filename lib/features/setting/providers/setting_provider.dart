import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/setting.dart';
import '../services/setting_service.dart';
import './setting_notifier.dart';


final settingsProvider = StateNotifierProvider<SettingNotifier, Setting>((ref) {
  final service = SettingService();

  // await service.load();
  return SettingNotifier(service);
});
