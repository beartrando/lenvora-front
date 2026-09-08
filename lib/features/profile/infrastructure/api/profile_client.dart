import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';
import 'package:front/infrastructure/http/clients/authorized_http_client.dart';
import 'package:front/infrastructure/proto/converters/profile/profile_response_converter.dart';

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
