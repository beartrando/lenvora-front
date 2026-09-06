import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/http/providers/http_client_provider.dart';

import './public_auth_client.dart';

final publicAuthClientProvider = Provider<PublicAuthClient>((ref) {
  return PublicAuthClient(ref.watch(httpClientProvider));
});
