import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/enums/battle_status.enum.dart';
import 'package:front/features/battle/infrastructure/websocket/battle_service.dart';
import 'package:front/features/battle/ui/widgets/battle_board_widget.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';

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
            title: Text(S.of(context).matchFinished),
            content: battle.winnerId == null
                ? (battle.status == BattleStatusEnum.cancelled
                      ? Text(S.of(context).cancelled)
                      : Text(S.of(context).draw))
                : Row(
                    children: [
                      (this.profile.id == battle.winnerId)
                          ? Text(S.of(context).youWon)
                          : Text(S.of(context).youLost),
                    ],
                  ),
            actions: [
              TextButton(
                onPressed: () {
                  this.battleService.channel.init();
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).playAgain),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("/");
                },
                child: Text(S.of(context).backToMenu),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).close),
              ),
            ],
          ),
        );
      });
    }

    if (battle.playerIds.length > 1) {
      try {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).battleTitle)),
          body: BattleBoardWideget(
            battle: battle,
            profile: profile,
            battleService: battleService,
          ),
        );
      } catch (e, st) {
        debugPrint("UI error: $e\n$st");
        return Text(S.of(context).error(e));
      }
    } else {
      return Scaffold(
        appBar: AppBar(title: Text(S.of(context).battleTitle)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(S.of(context).waitingForRival),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  battleService.connectBot(battle.id);
                },
                child: Text(S.of(context).playWithAi),
              ),
            ],
          ),
        ),
      );
    }
  }
}
