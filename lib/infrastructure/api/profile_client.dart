import 'dart:convert';

import 'package:front/contracts/proto/profile.pb.dart';
import 'package:front/features/profile/domain/value_objects/profile_id.dart';
import 'package:front/infrastructure/http/clients/authorized_http_client.dart';
import 'package:logger/logger.dart';

class ProfileClient {
  final AuthorizedHttpClient authorizedHttpClient;

  ProfileClient(this.authorizedHttpClient);

  Future<ProfileObject> getMe() async {
    final response = await authorizedHttpClient.get(
      '/profile/getMe',
    );

    final profileResponse = ProfileResponse()
      ..mergeFromProto3Json(jsonDecode(response.body as String)); // работает

    if (profileResponse.hasProfile()) {
      return profileResponse.profile;
    }

    if (profileResponse.hasError()) {
      throw Exception(profileResponse.error);
    }

    throw Exception('Empty profile response');
  }

  Future<ProfileObject?> getProfile(ProfileId profileId) async {
    try {
      final jsonString = await get(
        '/profile/get',
        {profileId: profileId.value},
      );

      final profileResponse = ProfileResponse()
        ..mergeFromProto3Json(jsonDecode(response.body as String)); // работает

      if (profileResponse.hasProfile()) {
        return profileResponse.profile;
      }

      if (profileResponse.hasError()) {
        throw Exception(profileResponse.error);
      }

      throw Exception('Empty profile response');
    }
  }
