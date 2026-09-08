
import 'package:front/infrastructure/auth/value_objects/access_token.dart';
import 'package:front/infrastructure/auth/value_objects/refresh_token.dart';

class AuthObject {
  final AccessToken accessToken;
  final RefreshToken refreshToken;

  const AuthObject({required this.accessToken, required this.refreshToken});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthObject &&
          other.accessToken == accessToken &&
          other.refreshToken == refreshToken;

  @override
  int get hashCode => Object.hash(accessToken, refreshToken);
}
