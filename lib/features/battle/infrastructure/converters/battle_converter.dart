import 'package:front/contracts/proto/battle.pb.dart' as proto;
import 'package:front/features/profile/domain/value_objects/profile_id.dart';
import 'package:front/infrastructure/converters/timestamp_converter.dart';

import '../../domain/entities/battle.dart';
import '../../domain/value_objects/battle_id.dart';
import '../../domain/value_objects/battle_player_ids.dart';
import './battle_board_converter.dart';
import './battle_status_converter.dart';

class BattleConverter {
  static Battle fromProto(proto.BattleObject object) {
    return Battle(
      id: BattleId(object.id),
      board: BattleBoardConverter.fromProto(object.board),
      playerIds: BattlePlayerIds(object.playerIds.map(ProfileId.new).toList()),
      status: BattleStatusConverter.fromProto(object.status),
      winnerId: object.winnerId.isEmpty ? null : ProfileId(object.winnerId),
      lastMoveAt: object.hasLastMoveAt()
          ? object.lastMoveAt.toDateTime()
          : null,
      createdAt: TimestampConverter().from(object.createdAt),
      updatedAt: TimestampConverter().from(object.updatedAt),
    );
  }
}
