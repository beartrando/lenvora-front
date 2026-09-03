import 'package:front/contracts/proto/auth.pb.dart';
import 'package:front/infrastructure/auth/token_storage.dart';
import 'package:logger/logger.dart';

import 'package:front/infrastructure/api/auth_api_provider.dart';

final logger = Logger();

class DeviceService {
  final DeviceClient authClient;
  final TokenStorage tokenStorage;

  DeviceService(this.authClient, this.tokenStorage);

  Future<void> clearJwt(TokenStorage tokenStorage) async {
    await tokenStorage.deleteAccessToken();
  }

  Future<String> getOrCreateJwt() async {
    final jwt = await tokenStorage.readAccessToken();
    if (jwt != null && jwt!.isNotEmpty) {
      return jwt;
    }

    final refreshToken = await tokenStorage.readRefreshToken();
    if (refreshToken != null && refreshToken!.isNotEmpty) {
      final DeviceObject response = await this.authClient.refreshTokens(
        refreshToken,
      );

      final newJwt = response.accessToken;

      await tokenStorage.saveAccessToken(newJwt);

      if (response.hasRefreshToken()) {
        await tokenStorage.saveRefreshToken(response.refreshToken);
      }
      return newJwt;
    }

    final deviceId = await DeviceService.getDeviceId();
    final response = await this.authClient.anonymousSignIn(deviceId);
    await tokenStorage.saveDeviceObject(response);

    return response.accessToken;
  }
}
