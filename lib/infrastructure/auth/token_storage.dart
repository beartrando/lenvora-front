import 'package:front/infrastructure/storage/secure_storage.dart';

import './value_objects/access_token.dart';
import './value_objects/auth_object.dart';
import './value_objects/refresh_token.dart';

class TokenStorage extends SecureStorage {
  final accessTokenKey = 'accessToken';
  final refreshTokenKey = 'refreshToken';
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
    await save(this.accessTokenKey, accessToken.value);
  }

  Future<AccessToken?> readAccessToken() async {
    if (_accessToken != null && _accessToken.value != '') {
      return _accessToken;
    }
    final _accessToken = await read(this.accessTokenKey);
    return AccessToken(_accessToken);
  }

  Future<void> deleteAccessToken() async {
    _accessToken = null;
    return await delete(this.accessTokenKey);
  }

  Future<void> saveRefreshToken(RefreshToken refreshToken) async {
    _refreshToken = refreshToken;
    await save(this.refreshTokenKey, refreshToken.value);
  }

  Future<RefreshToken?> readRefreshToken() async {
    if (_refreshToken != null && _refreshToken != '') {
      return _refreshToken;
    }
    final refreshToken = await read(this.refreshTokenKey);
    return RefreshToken(refreshToken);
  }

  Future<void> deleteRefreshToken() async {
    return await delete(this.refreshTokenKey);
  }

  Future<void> clearAll() async {
    await Future.wait([deleteAccessToken(), deleteRefreshToken()]);
  }
}
