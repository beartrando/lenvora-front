import 'package:front/contracts/proto/profile.pb.dart';
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/domain/profile/value_objects/profile_experience.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';
import 'package:front/domain/profile/value_objects/profile_level.dart';
import 'package:front/domain/profile/value_objects/profile_nickname.dart';
import 'package:front/domain/profile/value_objects/profile_rating.dart';

class ProfileConverter {
  static Profile fromProto(ProfileObject profile) {
    return Profile(
      id: ProfileId(profile.id),
      nickname: ProfileNickname(profile.nickname),
      level: ProfileLevel(profile.level),
      rating: ProfileRating(profile.rating),
      experience: ProfileExperience(profile.experience.toInt()),
    );
  }
}
