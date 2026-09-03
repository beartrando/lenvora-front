import './http_response.dart';

abstract interface class HttpClientInterface {
  Future<HttpResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<HttpResponse> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<HttpResponse> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<HttpResponse> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });
}
