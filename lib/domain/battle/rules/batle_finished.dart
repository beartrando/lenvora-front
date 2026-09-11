import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/enums/battle_status.enum.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';

class BattleFinished {
  const BattleFinished();

  bool calculate(Battle battle) {
    return (battle.status == BattleStatusEnum.finished) || (battle.status == BattleStatusEnum.cancelled);
  }
}
