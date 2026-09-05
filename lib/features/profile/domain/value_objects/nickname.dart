class Nickname {
  final String value;

  Nickname(String value) : value = value.trim() {
    if (this.value.isEmpty) {
      throw ArgumentError('Nickname cannot be empty');
    }

    if (this.value.length > 32) {
      throw ArgumentError('Nickname cannot be longer than 32 characters');
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Nickname && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
