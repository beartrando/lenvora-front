import 'package:front/contracts/proto/auth.pb.dart' as authProto;
import 'package:front/infrastructure/auth/value_objects/access_token.dart';
import 'package:front/infrastructure/auth/value_objects/auth_object.dart';
import 'package:front/infrastructure/auth/value_objects/refresh_token.dart';

class AuthObjectConverter {
  static AuthObject fromProto(authProto.AuthObject object) {
    return AuthObject(
      accessToken: AccessToken(object.accessToken),
      refreshToken: RefreshToken(object.refreshToken),
    );
  }
}
