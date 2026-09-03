import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/http/http_client.dart';

import './http_config_provider.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  return HttpClient(ref.watch(httpConfigProvider));
});
