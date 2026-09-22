import 'package:front/infrastructure/auth/value_objects/session_object.dart';
import 'package:front/infrastructure/auth/api/auth_client.dart';
import 'package:front/infrastructure/auth/token_storage.dart';
import 'package:front/infrastructure/auth/value_objects/access_token.dart';
import 'package:front/infrastructure/auth/value_objects/refresh_token.dart';
import 'package:front/infrastructure/device/device_service.dart';
import 'package:logger/logger.dart';

final logger = Logger();

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

  Future<AccessToken> getOrCreateAccessToken([bool force = false]) async {
    final accessToken = await tokenStorage.readAccessToken();

    if (!force && accessToken != null && accessToken.value.isNotEmpty) {
      return accessToken;
    }

    final deviceId = await deviceService.getDeviceId();

    final response = await authClient.anonymousSignIn(deviceId);

    await tokenStorage.saveAuthObject(response);

    return response.accessToken;
  }

  Future<bool> verifyAccessToken(AccessToken accesToken) async {
    return await authClient.verifyAccessToken(accesToken);
  }

  Future<AccessToken> ensureAccessToken() async {
    var accessToken = await tokenStorage.readAccessToken();

    if (accessToken != null) {
      try {
        final response = await authClient.verifyAccessToken(accessToken);
        if (response) {
          return accessToken;
        }
      } catch (e) {
        clearAccessToken();
        logger.i(e);
      }
    }

    var refreshToken = await tokenStorage.readRefreshToken();
    if (refreshToken != null) {
      try {
        return await refreshTokens();
      } catch (e) {
        clearRefreshToken();
        logger.i(e);
      }
    }

    return await getOrCreateAccessToken();
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
