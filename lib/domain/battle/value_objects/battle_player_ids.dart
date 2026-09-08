import 'package:front/domain/profile/value_objects/profile_id.dart';

class BattlePlayerIds {
  final List<ProfileId> value;

  BattlePlayerIds(List<ProfileId> value) : value = List.unmodifiable(value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BattlePlayerIds && _equals(other.value);

  @override
  int get hashCode => Object.hashAll(value);

  int get length => value.length;

  bool _equals(List<ProfileId> other) {
    if (value.length != other.length) {
      return false;
    }

    for (var i = 0; i < value.length; i++) {
      if (value[i] != other[i]) {
        return false;
      }
    }

    return true;
  }
}
