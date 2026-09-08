class ProfileExperience {
  final int value;

  const ProfileExperience(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileExperience && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
