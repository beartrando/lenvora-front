class AccessToken {
  final String value;

  const AccessToken(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AccessToken && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
