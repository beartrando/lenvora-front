import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/auth/api/auth_client_provider.dart';
import 'package:front/infrastructure/auth/auth_service.dart';
import 'package:front/infrastructure/auth/token_storage_provider.dart';
import 'package:front/infrastructure/device/providers/device_service_provider.dart';
import 'package:logger/logger.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final authClient = ref.watch(authClientProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  final deviceervice = ref.watch(deviceServiceProvider);
  var logger = Logger();

  // logger.d("Debug message");
  final authService = AuthService(authClient, tokenStorage, deviceervice);

  return authService;
});
