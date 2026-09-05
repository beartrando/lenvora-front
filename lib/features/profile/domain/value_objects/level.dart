class Level {
  final int value;

  const Level(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Level && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
