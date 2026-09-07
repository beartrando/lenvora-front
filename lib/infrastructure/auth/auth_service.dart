import 'package:front/infrastructure/auth/api/auth_client.dart';
import 'package:front/infrastructure/device/device_service.dart';

import './token_storage.dart';
import './value_objects/access_token.dart';

class AuthService {
  final AuthClient authClient;
  final TokenStorage tokenStorage;
  final DeviceService deviceService;

  AuthService(this.authClient, this.tokenStorage, this.deviceService);

  Future<void> clearAccessToken() async {
    await tokenStorage.deleteAccessToken();
  }

  Future<void> clearRefreshToken() async {
    await tokenStorage.deleteRefreshToken();
  }

  Future<void> clearTokens() async {
    await tokenStorage.deleteAccessToken();
    await tokenStorage.deleteRefreshToken();
  }

  Future<AccessToken> getAccessToken() async {
    final token = await tokenStorage.readAccessToken();

    if (token == null || token.value.isEmpty) {
      throw Exception('Access token is missing');
    }

    return token;
  }

  Future<AccessToken> getOrCreateAccessToken() async {
    final accessToken = await tokenStorage.readAccessToken();

    if (accessToken != null && accessToken.value.isNotEmpty) {
      return accessToken;
    }

    final deviceId = await deviceService.getDeviceId();

    final response = await authClient.anonymousSignIn(deviceId);

    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }

  Future<AccessToken> verifyAccessToken(AccessToken accesToken) async {
    final response = await authClient.verifyAccessToken(accesToken);

    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }

  Future<AccessToken> ensureAccessToken() async {
    var accessToken = await tokenStorage.readAccessToken();

    if (accessToken != null) {
      var response = await authClient.verifyAccessToken(accessToken);
      if (response.statusCode != 401) {
        return token;
      }
    }

    var refreshToken = await tokenStorage.readRefreshToken();
    if (refreshToken != null) {
      response = await this.refreshTokens();

      if (response.auth != null) {
        return await tokenStorage.readAccessToken();
      }
    }

    return await this.getOrCreateAccessToken();
  }

  Future<AccessToken> refreshTokens() async {
    final refreshToken = await tokenStorage.readRefreshToken();

    if (refreshToken == null || refreshToken.value.isEmpty) {
      throw Exception('Access token is missing');
    }

    final response = await authClient.refreshTokens(refreshToken);

    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }
}
