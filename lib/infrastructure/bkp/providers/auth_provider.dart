import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/src/locale/token_storage_provider.dart';
import 'package:logger/logger.dart';

import '../../features/auth/locale/auth_service_provider.dart';

final authProvider = FutureProvider<String>((ref) async {
  final tokenStorage = ref.watch(tokenStorageProvider);

  var accessToken = await tokenStorage.readAccessToken();

  if (accessToken != null && accessToken.isNotEmpty) {
    return accessToken;
  }

  final authService = await ref.watch(authServiceProvider.future);

  var logger = Logger();

  accessToken = await authService.getOrCreateJwt();
  logger.d("JWT получен: $accessToken");

  await tokenStorage.saveAccessToken(accessToken);

  return accessToken;
});
