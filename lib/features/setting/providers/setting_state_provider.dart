import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/setting.dart';
import './setting_service_provider.dart';

final settingStateProvider = FutureProvider<Setting>((ref) {
  final service = ref.watch(settingServiceProvider);

  return service.load();
});
