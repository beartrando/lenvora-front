import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import './token_storage.dart';

final logger = Logger();

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  final tokenStorage = TokenStorage();

  return tokenStorage;
});
