import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/enums/battle_status.enum.dart';

class BattleStarted {
  const BattleStarted();

  bool calculate(Battle battle) {
    if (battle.status != BattleStatusEnum.started) {
      return false;
    }

    if (battle.playerIds.length < 2) {
      return false;
    }

    return true;
  }
}
