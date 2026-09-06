class RefreshToken {
  final String value;

  const RefreshToken(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is RefreshToken && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
