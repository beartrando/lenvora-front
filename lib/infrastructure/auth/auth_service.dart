import 'package:front/contracts/proto/auth.pb.dart';
import 'package:front/infrastructure/api/auth_client.dart';
import 'package:front/infrastructure/device/device_service.dart';
import 'package:logger/logger.dart';

import './token_storage.dart';

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

  Future<String> getOrCreateJwt() async {
    final accessToken = await tokenStorage.readAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      return accessToken;
    }

    final refreshToken = await tokenStorage.readRefreshToken();

    if (refreshToken != null && refreshToken.isNotEmpty) {
      final AuthObject response = await authClient.refreshTokens(refreshToken);

      await tokenStorage.saveAuthObject(response);

      return response.accessToken;
    }

    final deviceId = await deviceService.getDeviceId();

    final AuthObject response = await authClient.anonymousSignIn(deviceId);

    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }
}
