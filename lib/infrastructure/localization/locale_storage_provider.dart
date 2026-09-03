import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:front/infrastructure/localization/locale_storage.dart';

final localeStorageProvider = Provider<LocaleStorage>((ref) {
  return LocaleStorage('en');
});