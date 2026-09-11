import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/enums/battle_status.enum.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';

class CanMove {
  const CanMove();

  bool calculate(Battle battle, ProfileId profileId) {
    if (battle.status != BattleStatusEnum.started) {
      return false;
    }

    if (battle.playerIds.length < 2) {
      return false;
    }

    final filledCount = battle.board.filledCount;

    final currentTurnIndex = filledCount % battle.playerIds.value.length;
    final currentPlayerId = battle.playerIds.value[currentTurnIndex];

    return currentPlayerId == profileId;
  }
}
