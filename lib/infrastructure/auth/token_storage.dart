import 'package:front/infrastructure/storage/secure_storage.dart';

import './value_objects/access_token.dart';
import './value_objects/auth_object.dart';
import './value_objects/refresh_token.dart';

class TokenStorage extends SecureStorage {
  static const accessTokenKey = 'accessToken';
  static const refreshTokenKey = 'refreshToken';

  AccessToken? _accessToken;
  RefreshToken? _refreshToken;

  Future<void> saveAuthObject(AuthObject authObject) async {
    await Future.wait([
      saveAccessToken(authObject.accessToken),
      saveRefreshToken(authObject.refreshToken),
    ]);
  }

  Future<void> saveAccessToken(AccessToken accessToken) async {
    _accessToken = accessToken;
    await save(accessTokenKey, accessToken.value);
  }

  Future<AccessToken?> readAccessToken() async {
    if (_accessToken != null) {
      return _accessToken;
    }

    final value = await read(accessTokenKey);

    if (value == null || value.isEmpty) {
      return null;
    }

    _accessToken = AccessToken(value);
    return _accessToken;
  }

  Future<void> deleteAccessToken() async {
    _accessToken = null;
    await delete(accessTokenKey);
  }

  Future<void> saveRefreshToken(RefreshToken refreshToken) async {
    _refreshToken = refreshToken;
    await save(refreshTokenKey, refreshToken.value);
  }

  Future<RefreshToken?> readRefreshToken() async {
    if (_refreshToken != null) {
      return _refreshToken;
    }

    final value = await read(refreshTokenKey);

    if (value == null || value.isEmpty) {
      return null;
    }

    _refreshToken = RefreshToken(value);
    return _refreshToken;
  }

  Future<void> deleteRefreshToken() async {
    _refreshToken = null;
    await delete(refreshTokenKey);
  }

  Future<void> clearAll() async {
    await Future.wait([deleteAccessToken(), deleteRefreshToken()]);
  }
}
