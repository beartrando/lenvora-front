import 'package:front/contracts/proto/battle.pb.dart' as proto;
import 'package:front/domain/battle/enums/battle_cell_value.enum.dart';
import 'package:front/domain/battle/value_objects/battle_board.dart';

class BattleBoardConverter {
  static BattleBoard fromProto(List<proto.BattleCellValue> cells) {
    return BattleBoard(cells.map(_cellValueFromProto).toList());
  }

  static BattleCellValueEnum _cellValueFromProto(proto.BattleCellValue value) {
    switch (value) {
      case proto.BattleCellValue.CELL_EMPTY:
        return BattleCellValueEnum.empty;
      case proto.BattleCellValue.CELL_X:
        return BattleCellValueEnum.x;
      case proto.BattleCellValue.CELL_O:
        return BattleCellValueEnum.o;
      default:
        throw Exception('Unknown BattleCellValue: $value');
    }
  }
}
