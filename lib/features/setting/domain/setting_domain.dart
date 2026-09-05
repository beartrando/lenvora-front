import 'value_objects/effects_sound_enabled.dart';
import 'value_objects/setting.dart';
import 'value_objects/sound_enabled.dart';
import 'value_objects/vibration_enabled.dart';

class SettingDomain {
  Setting _setting;

  SettingDomain(this._setting);

  Setting get setting => _setting;

  void setSoundEnabled(SoundEnabled value) {
    _setting = _setting.copyWith(soundEnabled: value);
  }

  void setEffectsSoundEnabled(EffectsSoundEnabled value) {
    _setting = _setting.copyWith(effectsSoundEnabled: value);
  }

  void setVibrationEnabled(VibrationEnabled value) {
    _setting = _setting.copyWith(vibrationEnabled: value);
  }
}
