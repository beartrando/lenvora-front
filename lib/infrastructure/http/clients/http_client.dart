import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/http_config.dart';
import '../models/http_response.dart';

class HttpClient {
  final HttpConfig config;

  HttpClient(this.config);

  Uri buildUri(String path, {Map<String, dynamic>? query}) {
    final uri = Uri.parse(
      '${config.schema}://${config.host}:${config.port}$path',
    );

    if (query == null) {
      return uri;
    }

    return uri.replace(
      queryParameters: query.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
  }

  Future<HttpResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await http.get(
      buildUri(path, query: query),
      headers: {'Content-Type': 'application/json', ...?headers},
    );

    return _buildResponse(response);
  }

  Future<HttpResponse> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final response = await http.post(
      buildUri(path),
      headers: {'Content-Type': 'application/json', ...?headers},
      body: _encodeBody(body),
    );

    return _buildResponse(response);
  }

  Future<HttpResponse> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final response = await http.put(
      buildUri(path),
      headers: {'Content-Type': 'application/json', ...?headers},
      body: _encodeBody(body),
    );

    return _buildResponse(response);
  }

  Future<HttpResponse> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final response = await http.delete(
      buildUri(path),
      headers: {'Content-Type': 'application/json', ...?headers},
      body: _encodeBody(body),
    );

    return _buildResponse(response);
  }

  String? _encodeBody(Object? body) {
    if (body == null) {
      return null;
    }

    if (body is String) {
      return body;
    }

    return jsonEncode(body);
  }

  HttpResponse _buildResponse(http.Response response) {
    return HttpResponse(
      statusCode: response.statusCode,
      body: response.body,
      headers: response.headers,
    );
  }
}
