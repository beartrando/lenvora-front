import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/setting_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingProvider);
    final notifier = ref.read(settingProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Звук'),
            value: setting.soundEnabled,
            onChanged: notifier.setSoundEnabled,
          ),
          SwitchListTile(
            title: const Text('Эффекты'),
            value: setting.effectsSoundEnabled,
            onChanged: notifier.setEffectsSoundEnabled,
          ),
          SwitchListTile(
            title: const Text('Вибрация'),
            value: setting.vibrationEnabled,
            onChanged: notifier.setVibrationEnabled,
          ),
        ],
      ),
    );
  }
}
