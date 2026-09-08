import 'package:front/infrastructure/auth/value_objects/access_token.dart';
import 'package:front/infrastructure/auth/value_objects/auth_object.dart';
import 'package:front/infrastructure/auth/value_objects/refresh_token.dart';
import 'package:front/infrastructure/device/value_objects/device_id.dart';
import 'package:front/infrastructure/http/clients/http_client.dart';
import 'package:front/infrastructure/proto/converters/auth/auth_response_converter.dart';
import 'package:front/infrastructure/proto/converters/success_response_converter.dart';

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

  Future<bool> verifyAccessToken(AccessToken accessToken) async {
    final response = await httpClient.post(
      '/auth/verify',
      headers: {'Authorization': 'Bearer ${accessToken.value}'},
    );

    return SuccessResponseConverter.fromString(response.body);
  }
}
