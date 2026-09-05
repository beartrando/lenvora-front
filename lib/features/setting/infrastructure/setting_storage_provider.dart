import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'setting_storage.dart';

final settingStorageProvider = Provider<SettingStorage>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);

  return SettingStorage(preferences);
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
