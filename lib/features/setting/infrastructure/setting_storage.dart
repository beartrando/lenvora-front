import 'dart:convert';

import 'package:front/domain/setting/value_objects/effects_sound_enabled.dart';
import 'package:front/domain/setting/value_objects/setting.dart';
import 'package:front/domain/setting/value_objects/sound_enabled.dart';
import 'package:front/domain/setting/value_objects/vibration_enabled.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingStorage {
  static const _key = 'setting';

  final SharedPreferences _preferences;

  SettingStorage(this._preferences);

  Future<Setting> load() async {
    final value = _preferences.getString(_key);

    if (value == null) {
      return Setting.defaultValue();
    }

    final json = jsonDecode(value) as Map<String, dynamic>;

    return Setting(
      soundEnabled: SoundEnabled(json['soundEnabled'] as bool),
      effectsSoundEnabled: EffectsSoundEnabled(
        json['effectsSoundEnabled'] as bool,
      ),
      vibrationEnabled: VibrationEnabled(json['vibrationEnabled'] as bool),
    );
  }

  Future<void> save(Setting setting) async {
    await _preferences.setString(
      _key,
      jsonEncode({
        'soundEnabled': setting.soundEnabled.value,
        'effectsSoundEnabled': setting.effectsSoundEnabled.value,
        'vibrationEnabled': setting.vibrationEnabled.value,
      }),
    );
  }
}
