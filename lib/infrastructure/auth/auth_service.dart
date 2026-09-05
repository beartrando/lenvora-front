import 'package:front/contracts/proto/auth.pb.dart';
import 'package:front/infrastructure/api/public_auth_client.dart';
import 'package:front/infrastructure/device/device_service.dart';

import './token_storage.dart';

class AuthService {
  final PublicAuthClient authClient;
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

  Future<String> getAccessToken() async {
    final token = await tokenStorage.readAccessToken();

    if (token == null || token.isEmpty) {
      throw Exception('Access token is missing');
    }

    return token;
  }

  Future<String> getOrCreateAccessToken() async {
    final accessToken = await tokenStorage.readAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      return accessToken;
    }

    final deviceId = await deviceService.getDeviceId();

    final AuthObject response = await authClient.anonymousSignIn(deviceId);

    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }

  Future<String> refreshTokens() async {
    final refreshToken = await tokenStorage.readRefreshToken();

    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception('Access token is missing');
    }

    final AuthObject response = await authClient.refreshTokens(refreshToken);

    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }
}
