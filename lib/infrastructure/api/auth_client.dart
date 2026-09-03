import 'package:front/contracts/proto/auth.pb.dart';
import 'package:front/infrastructure/http/http_client_interface.dart';

class AuthClient {
  final HttpClient http;

  AuthClient(this.http);

  Future<AuthObject> anonymousSignIn(String deviceId) async {
    final response = await http.post(
      '/auth/anonymous',
      body: {'deviceId': deviceId},
    );

    return AuthObject.fromJson(response.body as Map<String, dynamic>);
  }

  Future<AuthObject> refreshTokens(String refreshToken) async {
    final response = await http.post(
      '/auth/refresh',
      body: {'refreshToken': refreshToken},
    );

    return AuthObject.fromJson(response.body as Map<String, dynamic>);
  }
}
