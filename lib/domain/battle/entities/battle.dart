import 'package:front/domain/battle/enums/battle_status.enum.dart';
import 'package:front/domain/battle/value_objects/battle_board.dart';
import 'package:front/domain/battle/value_objects/battle_id.dart';
import 'package:front/domain/battle/value_objects/battle_player_ids.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';

class Battle {
  final BattleId id;
  final BattleBoard board;
  final BattlePlayerIds playerIds;
  BattleStatusEnum status;
  ProfileId? winnerId;
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

  @override
  String toString() {
    return 'Battle('
        'id: $id, '
        'board: $board, '
        'playerIds: $playerIds, '
        'status: $status, '
        'winnerId: $winnerId, '
        'lastMoveAt: $lastMoveAt, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt'
        ')';
  }

  bool hasRival() {
    return this.playerIds.length > 1;
  }

  bool isFinished() {
    return (this.status == BattleStatusEnum.finished) ||
        (this.status == BattleStatusEnum.cancelled);
  }
}
