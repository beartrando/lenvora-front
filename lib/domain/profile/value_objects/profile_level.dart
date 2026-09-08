class ProfileLevel {
  final int value;

  const ProfileLevel(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProfileLevel && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
