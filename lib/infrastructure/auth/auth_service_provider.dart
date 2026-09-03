import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/api/auth_api_provider.dart';
import 'package:logger/logger.dart';

import './auth_service.dart';
import './token_storage_provider.dart';

final authServiceProvider = FutureProvider<AuthService>((ref) async {
  final authApi = ref.watch(authApiProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  var logger = Logger();

  // logger.d("Debug message");
  final authService = AuthService(authApi, tokenStorage);

  return authService;
});
