import '../entities/profile.dart';
import '../repositories/profile_repository.dart';
import '../value_objects/experience.dart';
import '../value_objects/level.dart';
import '../value_objects/nickname.dart';
import '../value_objects/profile_id.dart';
import '../value_objects/rating.dart';
import 'profile_client.dart';

class ProfileRepository {
  final ProfileClient _client;

  ProfileRepository(this._client);

  @override
  Future<Profile?> get(ProfileId id) async {
    final profile = await _client.getProfile(id.value);

    if (profile == null) {
      return null;
    }

    return Profile(
      id: ProfileId(profile.id),
      nickname: Nickname(profile.nickname),
      level: Level(profile.level),
      rating: Rating(profile.rating),
      experience: Experience(profile.experience),
    );
  }

  @override
  Future<Profile?> getMe() async {
    final profile = await _client.getMe();

    if (profile == null) {
      return null;
    }

    return Profile(
      id: ProfileId(profile.id),
      nickname: Nickname(profile.nickname),
      level: Level(profile.level),
      rating: Rating(profile.rating),
      experience: Experience(profile.experience),
    );
  }
}
