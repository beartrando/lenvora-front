class BattleId {
  final String value;

  const BattleId(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BattleId && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
