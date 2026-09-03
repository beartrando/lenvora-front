import 'package:flutter_riverpod/flutter_riverpod.dart';

import './locale_storage_provider.dart';

final localeProvider = FutureProvider<String>((ref) async {
  final localeStorage = ref.watch(localeStorageProvider);

  return localeStorage.readLocale();
});
