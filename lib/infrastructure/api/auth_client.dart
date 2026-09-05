import 'dart:convert';

import 'package:front/contracts/proto/auth.pb.dart';
import 'package:front/infrastructure/http/http_client.dart';
import 'package:logger/logger.dart';

class AuthClient {
  final HttpClient http;

  AuthClient(this.http);

  Future<AuthObject> anonymousSignIn(String deviceId) async {
    final response = await http.post(
      '/auth/anonymousSignIn',
      body: {'deviceId': deviceId},
    );

    final json = jsonDecode(response.body as String);

    final logger = Logger();
    logger.d('---------------');
    logger.d(json);
    logger.d('---------------');

    final authResponse = AuthResponse()
      ..mergeFromProto3Json(jsonDecode(response.body as String));

    logger.d('---------------');
    logger.d(authResponse);
    logger.d('---------------');
    if (authResponse.hasAuth()) {
      return authResponse.auth;
    }

    if (authResponse.hasError()) {
      throw Exception(authResponse.error);
    }

    throw Exception('Empty auth response');
  }

  Future<AuthObject> refreshTokens(String refreshToken) async {
    final response = await http.post(
      '/auth/refreshTokens',
      body: {'refreshToken': refreshToken},
    );

    final authResponse = AuthResponse.fromJson(response.body as String);

    if (authResponse.hasAuth()) {
      return authResponse.auth;
    }

    if (authResponse.hasError()) {
      throw Exception(authResponse.error);
    }

    throw Exception('Empty auth response');
  }
}
