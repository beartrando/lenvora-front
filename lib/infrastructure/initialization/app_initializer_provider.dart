import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/setting/providers/setting_service_provider.dart';
import 'package:front/infrastructure/auth/auth_service_provider.dart';
import 'package:front/infrastructure/initialization/app_initializer.dart';

final appInitializerProvider = Provider<AppInitializer>((ref) {
  return AppInitializer(
    authService: ref.watch(authServiceProvider),
    settingService: ref.watch(settingServiceProvider),
  );
});
