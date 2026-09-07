import 'package:front/infrastructure/auth/auth_service.dart';
import 'package:front/infrastructure/http/models/http_response.dart';

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

    var response = await request(token.value);

    if (response.statusCode == 401) {
      await _authService.clearRefreshToken();
      token = await _authService.ensureAccessToken();
      response = await request(token.value);
    }
    return response;
  }
}
