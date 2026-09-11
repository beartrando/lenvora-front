import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/enums/battle_status.enum.dart';

class BattleFinished {
  const BattleFinished();

  bool calculate(Battle battle) {
    return (battle.status == BattleStatusEnum.finished) ||
        (battle.status == BattleStatusEnum.cancelled);
  }
}
