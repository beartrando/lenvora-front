import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/setting/domain/setting_domain.dart';
import 'package:front/features/setting/domain/value_objects/effects_sound_enabled.dart';
import 'package:front/features/setting/domain/value_objects/sound_enabled.dart';
import 'package:front/features/setting/domain/value_objects/vibration_enabled.dart';

import '../domain/value_objects/setting.dart';

class SettingNotifier extends StateNotifier<Setting> {
  final SettingDomain _settingDomain;

  SettingNotifier(this._settingDomain) : super(_settingDomain.setting);

  Future<void> setSoundEnabled(bool value) async {
    _settingDomain.setSoundEnabled(new SoundEnabled(value));
    state = _settingDomain.setting;
  }

  Future<void> setEffectsSoundEnabled(bool value) async {
    _settingDomain.setEffectsSoundEnabled(new EffectsSoundEnabled(value));
    state = _settingDomain.setting;
  }

  Future<void> setVibrationEnabled(bool value) async {
    _settingDomain.setVibrationEnabled(new VibrationEnabled(value));
    state = _settingDomain.setting;
  }
}
