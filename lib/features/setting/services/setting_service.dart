import 'package:shared_preferences/shared_preferences.dart';

import '../models/setting.dart';

class SettingService {
  static const _soundKey = 'setting.soundEnabled';
  static const _effectsKey = 'setting.effectsSoundEnabled';
  static const _vibrationKey = 'setting.vibrationEnabled';

  Future<SharedPreferences> getStorage() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> getSoundEnabled() async {
    final prefs = await getStorage();
    return prefs.getBool(_soundKey) ?? true;
  }

  Future<bool> getEffectsSoundEnabled() async {
    final prefs = await getStorage();
    return prefs.getBool(_effectsKey) ?? true;
  }

  Future<bool> getVibrationEnabled() async {
    final prefs = await getStorage();
    return prefs.getBool(_vibrationKey) ?? true;
  }

  Future<void> setSoundEnabled(bool value) async {
    final prefs = await getStorage();
    await prefs.setBool(_soundKey, value);
  }

  Future<void> setEffectsSoundEnabled(bool value) async {
    final prefs = await getStorage();
    await prefs.setBool(_effectsKey, value);
  }

  Future<void> setVibrationEnabled(bool value) async {
    final prefs = await getStorage();
    await prefs.setBool(_vibrationKey, value);
  }

  Future<Setting> load() async {
    return Setting(
      soundEnabled: await getSoundEnabled(),
      effectsSoundEnabled: await getEffectsSoundEnabled(),
      vibrationEnabled: await getVibrationEnabled(),
    );
  }
}
