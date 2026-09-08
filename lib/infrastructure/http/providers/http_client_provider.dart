import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/http/clients/http_client.dart';
import 'package:front/infrastructure/http/providers/http_config_provider.dart';


final httpClientProvider = Provider<HttpClient>((ref) {
  return HttpClient(ref.watch(httpConfigProvider));
});
