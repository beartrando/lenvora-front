import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/localization/locale_storage_provider.dart';

final localeProvider = FutureProvider<String>((ref) async {
  final localeStorage = ref.watch(localeStorageProvider);

  return localeStorage.readLocale();
});
