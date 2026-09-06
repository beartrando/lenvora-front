import 'package:front/infrastructure/auth/clients/auth_client.dart';
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

  Future<AccessToken> ensureAccessToken() async {
    var token = await this.getAccessToken();

    return token;
    // final AuthObject response = await authClient.verifyAccessToken(token);
    //
    // if (response.statusCode != 401) {
    //   return token;
    // }
    //
    // var token = await this.refreshTokens();
    //
    //
    // if (response.statusCode != 401) {
    //   return token;
    // }
    //
    // await _authService.clearAccessToken();
    // token = await _authService.refreshTokens();
    // response = await request(token);
    //
    // if (response.statusCode != 401) {
    //   return response;
    // }
    //
    // await _authService.clearRefreshToken();
    // token = await _authService.getOrCreateAccessToken();
    // return await request(token);
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
