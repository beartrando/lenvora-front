// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(error) => "Error: ${error}";

  static String m1(experience) => "Experience: ${experience}";

  static String m2(id) => "ID: ${id}";

  static String m3(level) => "Level: ${level}";

  static String m4(nickname) => "Nickname: ${nickname}";

  static String m5(rating) => "Rating: ${rating}";

  static String m6(seconds) => "(${seconds} s)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Tic Tac Toe"),
    "backToMenu": MessageLookupByLibrary.simpleMessage("Back to menu"),
    "battleCancelled": MessageLookupByLibrary.simpleMessage("Battle cancelled"),
    "battleTitle": MessageLookupByLibrary.simpleMessage("Battle: Tic Tac Toe"),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "connectionLost": MessageLookupByLibrary.simpleMessage(
      "Connection to the server was lost",
    ),
    "draw": MessageLookupByLibrary.simpleMessage("Draw"),
    "effects": MessageLookupByLibrary.simpleMessage("Effects"),
    "error": m0,
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "localeLoadingError": MessageLookupByLibrary.simpleMessage(
      "Failed to load locale. Please try again later.",
    ),
    "matchFinished": MessageLookupByLibrary.simpleMessage("Match finished"),
    "notYourTurn": MessageLookupByLibrary.simpleMessage("Not your turn"),
    "play": MessageLookupByLibrary.simpleMessage("Play"),
    "playAgain": MessageLookupByLibrary.simpleMessage("Play again"),
    "playWithAi": MessageLookupByLibrary.simpleMessage("Play with AI"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileExperience": m1,
    "profileId": m2,
    "profileLevel": m3,
    "profileNickname": m4,
    "profileRating": m5,
    "secondsRemaining": m6,
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "sound": MessageLookupByLibrary.simpleMessage("Sound"),
    "versus": MessageLookupByLibrary.simpleMessage("vs"),
    "vibration": MessageLookupByLibrary.simpleMessage("Vibration"),
    "waitingForRival": MessageLookupByLibrary.simpleMessage(
      "Waiting for rival...",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("Winner:"),
    "youLost": MessageLookupByLibrary.simpleMessage("You lost!"),
    "youWon": MessageLookupByLibrary.simpleMessage("You won!"),
    "yourTurn": MessageLookupByLibrary.simpleMessage("Your turn"),
  };
}
