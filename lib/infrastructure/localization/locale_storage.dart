import 'package:front/infrastructure/storage/secure_storage.dart';

class LocaleStorage extends SecureStorage {
  final _localeKey = 'locale';
  String? _locale;
  final String defaultLocale;

  LocaleStorage(this.defaultLocale);

  Future<void> saveLocale(String locale) async {
    _locale = locale;
    await save(_localeKey, locale);
  }

  Future<String> readLocale() async {
    if (_locale != null && _locale!.isNotEmpty) {
      return _locale!;
    }

    _locale = await read(_localeKey);

    if (_locale != null && _locale!.isNotEmpty) {
      return _locale!;
    }

    return defaultLocale;
  }

  Future<void> deleteLocale() async {
    _locale = null;
    return await delete(_localeKey);
  }

  Future<void> clearAll() async {
    await deleteLocale();
  }
}
