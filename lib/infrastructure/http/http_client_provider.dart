import 'package:flutter_riverpod/flutter_riverpod.dart';

import './http_client_interface.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  return HttpClient(baseUrl: ref.watch(apiConfigProvider).baseUrl);
});
