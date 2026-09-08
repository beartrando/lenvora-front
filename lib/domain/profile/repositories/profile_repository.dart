import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';
import 'package:front/features/profile/infrastructure/api/profile_client.dart';


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
