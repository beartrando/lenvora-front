import 'package:front/infrastructure/device/value_objects/device_id.dart';
import 'package:front/infrastructure/http/clients/http_client.dart';

import '../converters/auth_response_converter.dart';
import '../value_objects/auth_object.dart';
import '../value_objects/refresh_token.dart';

class AuthClient {
  final HttpClient httpClient;

  AuthClient(this.httpClient);

  Future<AuthObject> anonymousSignIn(DeviceId deviceId) async {
    final response = await httpClient.post(
      '/auth/anonymousSignIn',
      body: {'deviceId': deviceId.value},
    );

    return AuthResponseConverter.fromString(response.body);
  }

  Future<AuthObject> refreshTokens(RefreshToken refreshToken) async {
    final response = await httpClient.post(
      '/auth/refreshTokens',
      body: {'refreshToken': refreshToken.value},
    );

    return AuthResponseConverter.fromString(response.body);
  }

  Future<bool> verifyAccessToken(RefreshToken refreshToken) async {
    final response = await httpClient.post(
      '/auth/refreshTokens',
      body: {'refreshToken': refreshToken.value},
    );

    return AuthResponseConverter.fromString(response.body);
  }
}
