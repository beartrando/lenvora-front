import 'package:front/infrastructure/auth/auth_service.dart';

import './http_client.dart';

import 'package:front/infrastructure/auth/auth_service.dart';

import 'http_client.dart';
import 'http_response.dart';

class AuthorizedHttpClient {
  final HttpClient _http;
  final AuthService _authService;

  AuthorizedHttpClient(
      this._http,
      this._authService,
      );

  Future<HttpResponse> get(
      String path, {
        Map<String, String>? headers,
        Map<String, dynamic>? query,
      }) {
    return _request(
          () => _http.get(
        path,
        headers: headers,
        query: query,
      ),
    );
  }

  Future<HttpResponse> post(
      String path, {
        Map<String, String>? headers,
        Object? body,
      }) {
    return _request(
          () => _http.post(
        path,
        headers: headers,
        body: body,
      ),
    );
  }

  Future<HttpResponse> put(
      String path, {
        Map<String, String>? headers,
        Object? body,
      }) {
    return _request(
          () => _http.put(
        path,
        headers: headers,
        body: body,
      ),
    );
  }

  Future<HttpResponse> delete(
      String path, {
        Map<String, String>? headers,
        Object? body,
      }) {
    return _request(
          () => _http.delete(
        path,
        headers: headers,
        body: body,
      ),
    );
  }

  Future<HttpResponse> _request(
      Future<HttpResponse> Function() request,
      ) async {
    final accessToken = await _authService.getAccessToken();

    final response = await requestWithToken(
      request,
      accessToken,
    );

    if (response.statusCode != 401) {
      return response;
    }

    final refreshedToken = await _authService.refreshAccessToken();

    return requestWithToken(
      request,
      refreshedToken,
    );
  }

  Future<HttpResponse> requestWithToken(
      Future<HttpResponse> Function() request,
      String accessToken,
      ) {
    return request();
  }
}