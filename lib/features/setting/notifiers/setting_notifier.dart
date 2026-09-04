import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/setting.dart';
import '../providers/setting_service_provider.dart';
import '../services/setting_service.dart';

class SettingNotifier extends AsyncNotifier<Setting> {
  late final SettingService _service;

  @override
  Future<Setting> build() {
    _service = ref.read(settingServiceProvider);

    return _service.load();
  }

  Future<void> setSoundEnabled(bool value) async {
    await _service.setSoundEnabled(value);

    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(soundEnabled: value));
  }

  Future<void> setEffectsSoundEnabled(bool value) async {
    await _service.setEffectsSoundEnabled(value);

    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(effectsSoundEnabled: value));
  }

  Future<void> setVibrationEnabled(bool value) async {
    await _service.setVibrationEnabled(value);

    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(vibrationEnabled: value));
  }
}
