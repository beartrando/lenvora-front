class HttpException implements Exception {
  final int? statusCode;
  final String message;
  final Object? cause;

  const HttpException({this.statusCode, required this.message, this.cause});

  @override
  String toString() {
    if (statusCode != null) {
      return 'HttpException($statusCode): $message';
    }

    return 'HttpException: $message';
  }
}
