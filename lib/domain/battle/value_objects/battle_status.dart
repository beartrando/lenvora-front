
import 'package:front/domain/battle/enums/battle_status.enum.dart';

class BattleStatus {
  final BattleStatusEnum value;

  const BattleStatus(this.value);

  const BattleStatus.unknown() : value = BattleStatusEnum.unknown;

  const BattleStatus.created() : value = BattleStatusEnum.created;

  const BattleStatus.ready() : value = BattleStatusEnum.ready;

  const BattleStatus.active() : value = BattleStatusEnum.active;

  const BattleStatus.finished() : value = BattleStatusEnum.finished;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BattleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
