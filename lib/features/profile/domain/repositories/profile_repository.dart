import 'package:front/infrastructure/api/profile_client.dart';

import '../entities/profile.dart';
import '../value_objects/experience.dart';
import '../value_objects/level.dart';
import '../value_objects/nickname.dart';
import '../value_objects/profile_id.dart';
import '../value_objects/rating.dart';

class ProfileRepository {
  final ProfileClient _client;

  ProfileRepository(this._client);

  Future<Profile> getMe() async {
    final data = await _client.getMe();

    return Profile(
      id: ProfileId(data.id),
      nickname: Nickname(data.nickname),
      level: Level(data.level),
      rating: Rating(data.rating),
      experience: Experience(data.experience.toInt()),
    );
  }

  Future<Profile> get(ProfileId id) async {
    final data = await _client.getProfile(id);

    return Profile(
      id: ProfileId(data.id),
      nickname: Nickname(data.nickname),
      level: Level(data.level),
      rating: Rating(data.rating),
      experience: Experience(data.experience.toInt()),
    );
  }
}
