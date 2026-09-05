class Rating {
  final int value;

  const Rating(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Rating && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
