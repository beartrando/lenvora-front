import 'package:front/features/profile/domain/value_objects/profile_id.dart';

import '../domain/entities/battle.dart';
import '../domain/rules/can_move.dart';
import '../domain/value_objects/battle_id.dart';
import './battle_channel.dart';

class BattleService {
  final ProfileId profileId;
  final BattleChannel channel;

  BattleService(this.profileId, this.channel);

  void makeMove(Battle battle, int cellIndex) {
    if (!CanMove().calculate(battle, profileId)) {
      return;
    }

    channel.move(battle.id, cellIndex);
  }

  void connectBot(BattleId battleId) {
    channel.connectBot(battleId);
  }

  void leave(BattleId battleId) {
    channel.leave(battleId);
  }

  void start(BattleId battleId) {
    channel.start(battleId);
  }
}
