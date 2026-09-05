class ProfileId {
  final String value;

  const ProfileId(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProfileId && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

battle_board.dart
battle_id.dart
battle_player_ids.dart
battle_status.dart

battle_cell_value.enum.dart
battle_status.enum.dart