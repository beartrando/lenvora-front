import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/api/public_auth_client_provider.dart';
import 'package:front/infrastructure/device/device_service_provider.dart';
import 'package:logger/logger.dart';

import './auth_service.dart';
import './token_storage_provider.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final authClient = ref.watch(publicAuthClientProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  final deviceervice = ref.watch(deviceServiceProvider);
  var logger = Logger();

  // logger.d("Debug message");
  final authService = AuthService(authClient, tokenStorage, deviceervice);

  return authService;
});
