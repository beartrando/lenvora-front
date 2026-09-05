import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../clients/http_client.dart';
import './http_config_provider.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  return HttpClient(ref.watch(httpConfigProvider));
});
