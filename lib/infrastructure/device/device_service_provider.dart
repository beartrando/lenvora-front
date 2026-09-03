import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/auth/token_storage_provider.dart';
import 'package:logger/logger.dart';

import './device_service.dart';

final deviceServiceProvider = FutureProvider<DeviceService>((ref) async {
  final deviceApi = ref.watch(deviceApiProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  var logger = Logger();

  // logger.d("Debug message");
  final deviceService = DeviceService(deviceApi, tokenStorage);

  return deviceService;
});
