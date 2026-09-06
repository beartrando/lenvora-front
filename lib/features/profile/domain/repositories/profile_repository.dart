import 'package:front/features/profile/infrastructure/api/profile_client.dart';

import '../entities/profile.dart';
import '../value_objects/profile_experience.dart';
import '../value_objects/profile_id.dart';
import '../value_objects/profile_level.dart';
import '../value_objects/profile_nickname.dart';
import '../value_objects/profile_rating.dart';

class ProfileRepository {
  final ProfileClient _client;

  ProfileRepository(this._client);

  Future<Profile> getMe() async {
    return await _client.getMe();
  }

  Future<Profile> get(ProfileId id) async {
    return await _client.getProfile(id);
  }
}
