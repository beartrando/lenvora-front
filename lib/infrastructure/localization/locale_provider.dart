import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/localization/locale_storage_provider.dart';

final localeProvider = FutureProvider<Locale>((ref) async {
  final localeStorage = ref.watch(localeStorageProvider);
  final storedLocale = await localeStorage.readLocale();
  final languageCode = switch (storedLocale) {
    'ua' => 'uk',
    'us' => 'en',
    'ru' || 'uk' || 'en' => storedLocale,
    _ => 'en',
  };

  return Locale(languageCode);
});

Future<void> setLocale(WidgetRef ref, Locale locale) async {
  await ref.read(localeStorageProvider).saveLocale(locale.languageCode);
  ref.invalidate(localeProvider);
}
