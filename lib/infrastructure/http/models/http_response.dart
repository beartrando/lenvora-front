class HttpResponse {
  final int statusCode;
  final String? body;
  final Map<String, String> headers;

  const HttpResponse({
    required this.statusCode,
    this.body,
    this.headers = const {},
  });
}
