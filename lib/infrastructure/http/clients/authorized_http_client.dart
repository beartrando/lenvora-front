import 'dart:io';

import 'package:front/infrastructure/auth/auth_service.dart';

import './http_client.dart';

class AuthorizedHttpClient {
  final HttpClient _http;
  final AuthService _authService;

  AuthorizedHttpClient(this._authService, this._http);

  Future<HttpResponse> get(String path, {Map<String, dynamic>? query}) {
    return _request(
      (token) => _http.get(
        path,
        headers: {'Authorization': 'Bearer $token'},
        query: query,
      ),
    );
  }

  Future<HttpResponse> post(String path, {Object? body}) {
    return _request(
      (token) => _http.post(
        path,
        headers: {'Authorization': 'Bearer $token'},
        body: body,
      ),
    );
  }

  Future<HttpResponse> put(String path, {Object? body}) {
    return _request(
      (token) => _http.put(
        path,
        headers: {'Authorization': 'Bearer $token'},
        body: body,
      ),
    );
  }

  Future<HttpResponse> delete(String path, {Object? body}) {
    return _request(
      (token) => _http.delete(
        path,
        headers: {'Authorization': 'Bearer $token'},
        body: body,
      ),
    );
  }

  Future<HttpResponse> _request(
    Future<HttpResponse> Function(String token) request,
  ) async {
    var token = await _authService.getAccessToken();

    var response = await request(token);

    if (response.statusCode == 401) {
      token = await _authService.refreshAccessToken();
      response = await request(token);
    }

    return response;
  }
}
