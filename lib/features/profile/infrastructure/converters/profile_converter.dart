import 'package:front/contracts/proto/profile.pb.dart';

import '../../domain/entities/profile.dart';
import '../../domain/value_objects/experience.dart';
import '../../domain/value_objects/level.dart';
import '../../domain/value_objects/nickname.dart';
import '../../domain/value_objects/profile_id.dart';
import '../../domain/value_objects/rating.dart';

class ProfileConverter {
  Profile fromProto(ProfileObject profile) {
    return Profile(
      id: ProfileId(profile.id),
      nickname: Nickname(profile.nickname),
      level: Level(profile.level),
      rating: Rating(profile.rating),
      experience: Experience(profile.experience.toInt()),
    );
  }
}
