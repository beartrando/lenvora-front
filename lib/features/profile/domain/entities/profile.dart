import '../value_objects/experience.dart';
import '../value_objects/level.dart';
import '../value_objects/nickname.dart';
import '../value_objects/profile_id.dart';
import '../value_objects/rating.dart';

class Profile {
  final ProfileId id;
  Nickname nickname;
  Level level;
  Rating rating;
  Experience experience;

  Profile({
    required this.id,
    required this.nickname,
    required this.level,
    required this.rating,
    required this.experience,
  });

  void changeNickname(Nickname nickname) {
    this.nickname = nickname;
  }
}
