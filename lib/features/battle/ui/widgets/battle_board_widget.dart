import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/battle/domain/entities/battle.dart';
import 'package:front/features/battle/domain/enums/battle_cell_value.enum.dart';
import 'package:front/features/battle/domain/rules/can_move.dart';
import 'package:front/features/battle/domain/value_objects/battle_board.dart';
import 'package:front/features/profile/domain/entities/profile.dart';
import 'package:front/features/profile/ui/widgets/player_name.dart';
import 'package:front/infrastructure/app/app_config_provider.dart';

import '../../infrastructure/battle_service.dart';
import './turn_timer.dart';

class BattleBoardWidege extends ConsumerWidget {
  final Battle battle;
  final BattleService battleService;

  // final ProfileService profileService;
  final Profile profile;

  // final WidgetRef ref;

  const BattleBoardWidege({
    required this.profile,
    required this.battle,
    required this.battleService,
    // required this.profileService,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < battle.playerIds.length; i++) ...[
              PlayerName(profileId: battle.playerIds.value[i]),
              if (i < battle.playerIds.length - 1) const Text(' vs '),
            ],
          ],
        ),
        battle.winnerId == null
            ? (CanMove().calculate(battle, profile.id)
                  ? TurnTimer(
                      seconds: config.moveTimeout,
                      battleService: battleService,
                      battleId: battle.id,
                    )
                  : const Text('Not your turn'))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Winner: '),
                  PlayerName(profileId: battle.winnerId!),
                ],
              ),

        const SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              debugPrint("Cells raw: ${battle.board}");
              final cellValue = safeCellAt(battle.board, index);
              return GestureDetector(
                onTap: () {
                  if (CanMove().calculate(battle, profile.id)) {
                    battleService.makeMove(battle, index);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white), // белая рамка
                    color: Colors.grey[900],
                  ),
                  child: Center(
                    child: Text(
                      _renderCell(cellValue),
                      style: TextStyle(
                        fontSize: 32,
                        color: _cellColor(
                          cellValue,
                        ), // цвет зависит от значения
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  BattleCellValueEnum safeCellAt(BattleBoard board, int index) {
    if (board.validateIndex(index)) {
      return board[index];
    }
    return BattleCellValueEnum.empty;
  }

  String _renderCell(BattleCellValueEnum value) {
    switch (value) {
      case BattleCellValueEnum.x:
        return 'X';
      case BattleCellValueEnum.o:
        return 'O';
      case BattleCellValueEnum.empty:
      default:
        return '';
    }
  }

  Color _cellColor(BattleCellValueEnum value) {
    switch (value) {
      case BattleCellValueEnum.x:
        return Colors.red; // X красный
      case BattleCellValueEnum.o:
        return Colors.blue; // O синий
      case BattleCellValueEnum.empty:
      default:
        return Colors.white; // пустая клетка белая
    }
  }
}
