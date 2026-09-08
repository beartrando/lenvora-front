
import 'package:front/domain/profile/value_objects/profile_experience.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';
import 'package:front/domain/profile/value_objects/profile_level.dart';
import 'package:front/domain/profile/value_objects/profile_nickname.dart';
import 'package:front/domain/profile/value_objects/profile_rating.dart';

class Profile {
  final ProfileId id;
  ProfileNickname nickname;
  ProfileLevel level;
  ProfileRating rating;
  ProfileExperience experience;

  Profile({
    required this.id,
    required this.nickname,
    required this.level,
    required this.rating,
    required this.experience,
  });

  void setNickname(ProfileNickname nickname) {
    this.nickname = nickname;
  }
}
