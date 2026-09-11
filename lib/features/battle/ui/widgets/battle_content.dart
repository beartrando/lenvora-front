import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/enums/battle_status.enum.dart';
import 'package:front/features/battle/infrastructure/websocket/battle_service.dart';
import 'package:front/features/battle/ui/widgets/battle_board_widget.dart';
import 'package:front/features/profile/ui/widgets/player_name.dart';

class BattleContent extends ConsumerWidget {
  final Battle battle;
  final dynamic profile;
  final BattleService battleService;

  const BattleContent({
    super.key,
    required this.battle,
    required this.profile,
    required this.battleService,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (battle.status == BattleStatusEnum.finished ||
        battle.status == BattleStatusEnum.cancelled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            title: const Text("Матч завершён"),
            content: battle.winnerId == null
                ? (battle.status == BattleStatusEnum.cancelled
                      ? const Text("Отменено")
                      : const Text("Ничья"))
                : Row(
                    children: [
                      (this.profile.id == battle.winnerId)
                          ? const Text("Вы победили!")
                          : const Text("Вы проиграли!"),
                    ],
                  ),
            actions: [
              TextButton(
                onPressed: () {
                  this.battleService.channel.init();
                  Navigator.of(context).pop();
                },
                child: const Text("Играть ещё"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("/");
                },
                child: const Text("Выйти в меню"),
              ),
            ],
          ),
        );
      });
    }

    if (battle.playerIds.length > 1) {
      try {
        return Scaffold(
          appBar: AppBar(title: const Text('Battle: Tic Tac Toe')),
          body: BattleBoardWideget(
            battle: battle,
            profile: profile,
            battleService: battleService,
          ),
        );
      } catch (e, st) {
        debugPrint("UI error: $e\n$st");
        return Text("UI error: ${e.toString()}");
      }
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Battle: Tic Tac Toe')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              const Text('Waiting for rival...'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  battleService.connectBot(battle.id);
                },
                child: const Text('Play with AI'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
