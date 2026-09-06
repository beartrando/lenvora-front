import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/battle/widgets/battle_content.dart';
import 'package:front/features/profile/providers/my_profile_provider.dart';
import 'package:front/src/contracts/proto/battle.pb.dart';
import 'package:front/src/locale/auth_provider.dart';
import 'package:front/src/params/client_params.dart';

import '../../battle/params/battle_params.dart';
import '../../battle/providers/battle_stream_provider.dart';
import '../domain/battle_domain.dart';
import '../domain/battle_domain_provider.dart';

class BattleScreen extends ConsumerStatefulWidget {
  const BattleScreen({super.key});

  @override
  ConsumerState<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends ConsumerState<BattleScreen> {
  late BattleService battleService;
  late BattleObject? _battle;

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(myProfileProvider);

    return profileAsync.when(
      data: (profile) {
        final battleServiceAsync = ref.watch(battleServiceProvider);
        return battleServiceAsync.when(
          data: (service) {
            battleService = service;
            final battleAsync = ref.watch(battleStreamProvider);

            return battleAsync.when(
              data: (battle) {
                _battle = battle;
                return BattleContent(
                  battle: battle,
                  profile: profile,
                  battleService: battleService,
                );
              },
              loading: () {
                debugPrint("Battle stream loading...");
                return const Center(child: CircularProgressIndicator());
              },
              error: (err, stack) {
                debugPrint("Battle stream error: $err\n$stack");
                return Center(child: Text('Ошибка: $err'));
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text("Profile error: $e"),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text("Profile error: $e"),
    );
  }

  @override
  void dispose() {
    debugPrint("BattleScreen dispose");
    final battle = _battle;
    if (battle != null) {
      battleService.leave(battleId: battle.id);
    }
    super.dispose();
  }
}
