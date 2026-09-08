import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/rules/can_move.dart';
import 'package:front/domain/battle/value_objects/battle_id.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';
import 'package:front/features/battle/infrastructure/websocket/battle_channel.dart';


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
