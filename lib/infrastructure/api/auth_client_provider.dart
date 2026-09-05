import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/http/providers/http_client_provider.dart';

import './auth_client.dart';

final authClientProvider = Provider<AuthClient>((ref) {
  return AuthClient(ref.watch(httpClientProvider));
});
