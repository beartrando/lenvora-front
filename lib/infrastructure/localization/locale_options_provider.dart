import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleOption {
  final String code;
  final Locale locale;
  final String emoji;

  const LocaleOption(this.code, this.locale, this.emoji);
}

final localeOptionsProvider = Provider<List<LocaleOption>>((ref) {
  return const [
    LocaleOption('ru', Locale('ru'), '🇷🇺'),
    LocaleOption('uk', Locale('uk'), '🇺🇦'),
    LocaleOption('en', Locale('en'), '🇺🇸'),
  ];
});
