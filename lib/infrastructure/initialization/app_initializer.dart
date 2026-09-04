import 'package:front/features/setting/services/setting_service.dart';
import 'package:front/infrastructure/auth/auth_service.dart';

class AppInitializer {
  final AuthService _authService;
  final SettingService _settingService;

  AppInitializer({
    required AuthService authService,
    required SettingService settingService,
  })  : _authService = authService,
        _settingService = settingService;

  Future<void> initialize() async {
    await _authService.getOrCreateJwt();
    await _settingService.load();
  }
}
