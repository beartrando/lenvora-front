import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/auth/auth_service_provider.dart';
import 'package:front/infrastructure/http/config/http_config.dart';

import './profile_client.dart';

final profileClientProvider = Provider.family<ProfileClient, HttpConfig>((
  ref,
  config,
) {
  final authService = ref.read(authServiceProvider);
  return ProfileClient(authService, config);
});
