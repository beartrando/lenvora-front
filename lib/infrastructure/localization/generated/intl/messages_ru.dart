// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(error) => "Ошибка: ${error}";

  static String m1(experience) => "Опыт: ${experience}";

  static String m2(id) => "ID: ${id}";

  static String m3(level) => "Уровень: ${level}";

  static String m4(nickname) => "Никнейм: ${nickname}";

  static String m5(rating) => "Рейтинг: ${rating}";

  static String m6(seconds) => "(${seconds} с)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Крестики-нолики"),
    "backToMenu": MessageLookupByLibrary.simpleMessage("Выйти в меню"),
    "battleCancelled": MessageLookupByLibrary.simpleMessage("Матч отменён"),
    "battleTitle": MessageLookupByLibrary.simpleMessage(
      "Матч: Крестики-нолики",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Отменено"),
    "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
    "connectionLost": MessageLookupByLibrary.simpleMessage(
      "Соединение с сервером потеряно",
    ),
    "draw": MessageLookupByLibrary.simpleMessage("Ничья"),
    "effects": MessageLookupByLibrary.simpleMessage("Эффекты"),
    "error": m0,
    "loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
    "localeLoadingError": MessageLookupByLibrary.simpleMessage(
      "Не удалось загрузить язык. Попробуйте ещё раз позже.",
    ),
    "matchFinished": MessageLookupByLibrary.simpleMessage("Матч завершён"),
    "notYourTurn": MessageLookupByLibrary.simpleMessage("Ход соперника"),
    "play": MessageLookupByLibrary.simpleMessage("Играть"),
    "playAgain": MessageLookupByLibrary.simpleMessage("Играть ещё"),
    "playWithAi": MessageLookupByLibrary.simpleMessage("Играть с ИИ"),
    "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "profileExperience": m1,
    "profileId": m2,
    "profileLevel": m3,
    "profileNickname": m4,
    "profileRating": m5,
    "secondsRemaining": m6,
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "sound": MessageLookupByLibrary.simpleMessage("Звук"),
    "versus": MessageLookupByLibrary.simpleMessage("против"),
    "vibration": MessageLookupByLibrary.simpleMessage("Вибрация"),
    "waitingForRival": MessageLookupByLibrary.simpleMessage(
      "Ожидание соперника...",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("Победитель:"),
    "youLost": MessageLookupByLibrary.simpleMessage("Вы проиграли!"),
    "youWon": MessageLookupByLibrary.simpleMessage("Вы победили!"),
    "yourTurn": MessageLookupByLibrary.simpleMessage("Ваш ход"),
  };
}
