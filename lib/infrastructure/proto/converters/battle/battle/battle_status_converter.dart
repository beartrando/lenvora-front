import 'package:front/contracts/proto/battle.pb.dart' as proto;
import 'package:front/domain/battle/enums/battle_status.enum.dart';

class BattleStatusConverter {
  static BattleStatusEnum fromProto(proto.BattleStatus value) {
    switch (value) {
      case proto.BattleStatus.UNKNOWN:
        return BattleStatusEnum.unknown;
      case proto.BattleStatus.CREATED:
        return BattleStatusEnum.created;
      case proto.BattleStatus.READY:
        return BattleStatusEnum.ready;
      case proto.BattleStatus.STARTED:
        return BattleStatusEnum.started;
      case proto.BattleStatus.FINISHED:
        return BattleStatusEnum.finished;
      case proto.BattleStatus.FINISHED:
        return BattleStatusEnum.finished;
      default:
        throw Exception('Unknown BattleStatus: $value');
    }
  }
}
