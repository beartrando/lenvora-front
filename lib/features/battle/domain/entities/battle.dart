import '../enums/battle_status.enum.dart';
import '../value_objects/battle_board.dart';
import '../value_objects/battle_id.dart';
import '../value_objects/battle_player_ids.dart';

class Battle {
  final BattleId id;
  final BattleBoard board;
  final BattlePlayerIds playerIds;
  BattleStatusEnum status;
  BattleId? winnerId;
  final DateTime? lastMoveAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Battle({
    required this.id,
    required this.board,
    required this.playerIds,
    required this.status,
    this.winnerId,
    this.lastMoveAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
