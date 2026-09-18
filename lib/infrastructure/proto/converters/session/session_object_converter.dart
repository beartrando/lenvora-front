import 'package:front/contracts/proto/auth.pb.dart' as authProto;
import 'package:front/infrastructure/auth/value_objects/access_token.dart';
import 'package:front/infrastructure/auth/value_objects/session_object.dart';
import 'package:front/infrastructure/auth/value_objects/refresh_token.dart';

class SessionObjectConverter {
  static SessionObject fromProto(authProto.SessionObject object) {
    return SessionObject(
      accessToken: AccessToken(object.accessToken),
      refreshToken: RefreshToken(object.refreshToken),
    );
  }
}
