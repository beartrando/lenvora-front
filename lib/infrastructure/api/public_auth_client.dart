import 'dart:convert';

import 'package:front/contracts/proto/auth.pb.dart';
import 'package:front/infrastructure/http/clients/http_client.dart';

class PublicAuthClient {
  final HttpClient httpClient;

  PublicAuthClient(this.httpClient);

  Future<AuthObject> anonymousSignIn(String deviceId) async {
    final response = await httpClient.post(
      '/auth/anonymousSignIn',
      body: {'deviceId': deviceId},
    );

    final authResponse = AuthResponse()
      ..mergeFromProto3Json(jsonDecode(response.body as String)); // работает

    if (authResponse.hasAuth()) {
      return authResponse.auth;
    }

    if (authResponse.hasError()) {
      throw Exception(authResponse.error);
    }

    throw Exception('Empty auth response');
  }

  Future<AuthObject> refreshTokens(String refreshToken) async {
    final response = await httpClient.post(
      '/auth/refreshTokens',
      body: {'refreshToken': refreshToken},
    );

    final authResponse = AuthResponse()
      ..mergeFromProto3Json(jsonDecode(response.body as String)); // работает

    if (authResponse.hasAuth()) {
      return authResponse.auth;
    }

    if (authResponse.hasError()) {
      throw Exception(authResponse.error);
    }

    throw Exception('Empty auth response');
  }
}
