import 'package:front/contracts/proto/auth.pb.dart';
import 'package:front/infrastructure/device/device_service.dart';
import 'package:logger/logger.dart';

import './token_storage.dart';

final logger = Logger();

class AuthService {
  final AuthApi authApi;
  final TokenStorage tokenStorage;
  final DeviceService deviceService;

  AuthService(this.authApi, this.tokenStorage, this.deviceService);

  Future<void> clearAccesToken() async {
    await tokenStorage.deleteAccessToken();
  }

  Future<void> clearRefreshToken() async {
    await tokenStorage.deleteRefreshToken();
  }

  Future<void> clearTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }

  Future<String> getOrCreateJwt() async {
    final accessToken = await tokenStorage.readAccessToken();
    if (accessToken != null && accessToken!.isNotEmpty) {
      return accessToken;
    }

    final refreshToken = await tokenStorage.readRefreshToken();
    if (refreshToken != null && refreshToken!.isNotEmpty) {
      final AuthObject response = await this.authApi.refreshTokens(
        refreshToken,
      );

      final newAccessToken = response.accessToken;

      await tokenStorage.saveAccessToken(newAccessToken);

      if (response.hasRefreshToken()) {
        await tokenStorage.saveRefreshToken(response.refreshToken);
      }
      return newAccessToken;
    }

    final deviceId = await deviceService.getDeviceId();
    final response = await this.authApi.anonymousSignIn(deviceId);
    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }
}
