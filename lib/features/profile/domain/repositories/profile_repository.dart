import 'package:front/features/profile/infrastructure/api/profile_client.dart';

import '../entities/profile.dart';
import '../value_objects/profile_id.dart';

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
