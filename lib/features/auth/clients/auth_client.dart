import 'package:front/src/api/gateway_client.dart';
import 'package:front/src/contracts/proto/auth.pb.dart';
import 'package:front/src/helpers/parse_proto.dart';
import 'package:logger/logger.dart';

class AuthClient extends GatewayClient {
  AuthClient(super.config);

  Future<AuthObject> anonymousSignIn(String deviceId) async {
    final jsonString = await post('/auth/anonymousSignIn', {
      'deviceId': deviceId,
    });
    final logger = new Logger();
    logger.d(jsonString);
    return parseProto(() => AuthResponse(), jsonString).auth;
  }

  Future<AuthObject> refreshTokens(String refreshToken) async {
    final jsonString = await post('/auth/refreshTokens', {
      'token': refreshToken,
    });
    return parseProto(() => AuthResponse(), jsonString).auth;
  }
}
