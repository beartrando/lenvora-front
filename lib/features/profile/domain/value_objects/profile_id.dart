class ProfileId {
  final String value;

  const ProfileId(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProfileId && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
