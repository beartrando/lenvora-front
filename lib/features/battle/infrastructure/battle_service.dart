import 'package:front/features/battle/domain/entities/battle.dart';
import 'package:front/features/battle/domain/value_objects/battle_id.dart';

class BattleService {
  final ProfileId profileId;
  final BattleChannel channel;

  BattleService(this.profileId, this.channel);

  void makeMove(Battle battle, int cellIndex) {
    if (!battle.canMove(profileId)) {
      return;
    }

    channel.move(battle.id.value, cellIndex);
  }

  void connectBot(BattleId battleId) {
    channel.connectBot(battleId.value);
  }

  void leave(BattleId battleId) {
    channel.leave(battleId.value);
  }

  void start(BattleId battleId) {
    channel.start(battleId.value);
  }
}
