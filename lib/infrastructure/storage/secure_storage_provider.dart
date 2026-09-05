import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import './secure_storage.dart';

final logger = Logger();

final secureStorageProvider = Provider<SecureStorage>((ref) {
  final secureStorage = SecureStorage();

  return secureStorage;
});
