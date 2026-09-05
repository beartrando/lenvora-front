class ProfileRating {
  final int value;

  const ProfileRating(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProfileRating && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
