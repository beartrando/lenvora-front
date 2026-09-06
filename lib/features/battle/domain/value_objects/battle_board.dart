import '../enums/battle_cell_value.enum.dart';

class BattleBoard {
  static const int size = 9;

  final List<BattleCellValue> cells;

  BattleBoard(List<BattleCellValue> cells)
    : assert(cells.length == size),
      cells = List.unmodifiable(cells);

  BattleCellValue operator [](int index) => cells[index];

  int get filledCount =>
      cells.where((cell) => cell != BattleCellValue.empty).length;
}
