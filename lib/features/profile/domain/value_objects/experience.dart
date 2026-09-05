class Experience {
  final int value;

  const Experience(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Experience && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
