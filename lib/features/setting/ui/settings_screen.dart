import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/setting/application/setting_provider.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingProvider);
    final notifier = ref.read(settingProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(S.of(context).sound),
            value: setting.soundEnabled.value,
            onChanged: notifier.setSoundEnabled,
          ),
          SwitchListTile(
            title: Text(S.of(context).effects),
            value: setting.effectsSoundEnabled.value,
            onChanged: notifier.setEffectsSoundEnabled,
          ),
          SwitchListTile(
            title: Text(S.of(context).vibration),
            value: setting.vibrationEnabled.value,
            onChanged: notifier.setVibrationEnabled,
          ),
        ],
      ),
    );
  }
}
