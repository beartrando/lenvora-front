import 'package:front/contracts/proto/auth.pb.dart' as auth_proto;
import 'package:front/infrastructure/auth/value_objects/access_token.dart';
import 'package:front/infrastructure/auth/value_objects/refresh_token.dart';
import 'package:front/infrastructure/auth/value_objects/session_object.dart';

class SessionObjectConverter {
  static SessionObject fromProto(auth_proto.SessionObject object) {
    return SessionObject(
      accessToken: AccessToken(object.accessToken),
      refreshToken: RefreshToken(object.refreshToken),
    );
  }
}
