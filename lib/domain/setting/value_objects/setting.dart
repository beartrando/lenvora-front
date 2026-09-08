
import 'package:front/domain/setting/value_objects/effects_sound_enabled.dart';
import 'package:front/domain/setting/value_objects/sound_enabled.dart';
import 'package:front/domain/setting/value_objects/vibration_enabled.dart';

class Setting {
  final SoundEnabled soundEnabled;
  final EffectsSoundEnabled effectsSoundEnabled;
  final VibrationEnabled vibrationEnabled;

  const Setting({
    required this.soundEnabled,
    required this.effectsSoundEnabled,
    required this.vibrationEnabled,
  });

  const Setting.defaultValue()
    : soundEnabled = const SoundEnabled(true),
      effectsSoundEnabled = const EffectsSoundEnabled(true),
      vibrationEnabled = const VibrationEnabled(true);

  Setting copyWith({
    SoundEnabled? soundEnabled,
    EffectsSoundEnabled? effectsSoundEnabled,
    VibrationEnabled? vibrationEnabled,
  }) {
    return Setting(
      soundEnabled: soundEnabled ?? this.soundEnabled,
      effectsSoundEnabled: effectsSoundEnabled ?? this.effectsSoundEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
    );
  }
}
