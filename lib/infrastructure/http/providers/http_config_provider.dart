import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/http_config.dart';

final httpConfigProvider = Provider<HttpConfig>((ref) {
  return HttpConfig.fromEnv();
});
