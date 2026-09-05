import 'dart:convert';

import 'package:front/contracts/proto/profile.pb.dart';
import 'package:front/infrastructure/http/clients/authorized_http_client.dart';
import 'package:logger/logger.dart';

class ProfileClient {
  final AuthorizedHttpClient authorizedHttpClient;

  ProfileClient(this.authorizedHttpClient);

  Future<ProfileObject?> getMe() async {
    try {
      final jsonString = await get(
        '/profile/getMe',
        headers: {'Authorization': 'Bearer ${jwt}'},
      );

      final logger = new Logger();
      logger.d(jsonString);

      return parseProto(() => ProfileResponse(), jsonString).profile;
    } catch (e, st) {
      Logger().e("getProfile failed $e $st");
      return null;
    }
  }

  Future<ProfileObject?> getProfile(string jwt, String profileId) async {
    try {
      final jsonString = await get(
        '/profile/get?profileId=$profileId',
        headers: {'Authorization': 'Bearer ${jwt}'},
      );

      final logger = Logger();
      logger.d(jsonString);

      return parseProto(() => ProfileResponse(), jsonString).profile;
    } catch (e, st) {
      Logger().e("getProfile failed $e $st");
      return null;
    }
  }
}
