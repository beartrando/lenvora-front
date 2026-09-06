import 'package:front/features/profile/domain/entities/profile.dart';
import 'package:front/features/profile/domain/value_objects/profile_id.dart';
import 'package:front/features/profile/infrastructure/converters/profile_response_converter.dart';
import 'package:front/infrastructure/http/clients/authorized_http_client.dart';

class ProfileClient {
  final AuthorizedHttpClient authorizedHttpClient;

  ProfileClient(this.authorizedHttpClient);

  Future<Profile> getMe() async {
    final response = await authorizedHttpClient.get('/profile/getMe');

    return ProfileResponseConverter.fromString(response.body);
  }

  Future<Profile> getProfile(ProfileId profileId) async {
    final response = await authorizedHttpClient.get(
      '/profile/get',
      query: {'profileId': profileId.value},
    );

    return ProfileResponseConverter.fromString(response.body);
  }
}
