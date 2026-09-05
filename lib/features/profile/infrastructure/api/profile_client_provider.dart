import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/http/providers/authorized_http_client_provider.dart';

import 'profile_client.dart';

final profileClientProvider = Provider<ProfileClient>((ref) {
  return ProfileClient(ref.watch(authorizedHttpClientProvider));
});
