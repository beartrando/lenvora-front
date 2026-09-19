// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tic Tac Toe`
  String get appTitle {
    return Intl.message('Tic Tac Toe', name: 'appTitle', desc: '', args: []);
  }

  /// `Play`
  String get play {
    return Intl.message('Play', name: 'play', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Sound`
  String get sound {
    return Intl.message('Sound', name: 'sound', desc: '', args: []);
  }

  /// `Effects`
  String get effects {
    return Intl.message('Effects', name: 'effects', desc: '', args: []);
  }

  /// `Vibration`
  String get vibration {
    return Intl.message('Vibration', name: 'vibration', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `ID: {id}`
  String profileId(Object id) {
    return Intl.message('ID: $id', name: 'profileId', desc: '', args: [id]);
  }

  /// `Nickname: {nickname}`
  String profileNickname(Object nickname) {
    return Intl.message(
      'Nickname: $nickname',
      name: 'profileNickname',
      desc: '',
      args: [nickname],
    );
  }

  /// `Level: {level}`
  String profileLevel(Object level) {
    return Intl.message(
      'Level: $level',
      name: 'profileLevel',
      desc: '',
      args: [level],
    );
  }

  /// `Rating: {rating}`
  String profileRating(Object rating) {
    return Intl.message(
      'Rating: $rating',
      name: 'profileRating',
      desc: '',
      args: [rating],
    );
  }

  /// `Experience: {experience}`
  String profileExperience(Object experience) {
    return Intl.message(
      'Experience: $experience',
      name: 'profileExperience',
      desc: '',
      args: [experience],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Error: {error}`
  String error(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'error',
      desc: '',
      args: [error],
    );
  }

  /// `Connection to the server was lost`
  String get connectionLost {
    return Intl.message(
      'Connection to the server was lost',
      name: 'connectionLost',
      desc: '',
      args: [],
    );
  }

  /// `Battle: Tic Tac Toe`
  String get battleTitle {
    return Intl.message(
      'Battle: Tic Tac Toe',
      name: 'battleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Match finished`
  String get matchFinished {
    return Intl.message(
      'Match finished',
      name: 'matchFinished',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message('Cancelled', name: 'cancelled', desc: '', args: []);
  }

  /// `Draw`
  String get draw {
    return Intl.message('Draw', name: 'draw', desc: '', args: []);
  }

  /// `You won!`
  String get youWon {
    return Intl.message('You won!', name: 'youWon', desc: '', args: []);
  }

  /// `You lost!`
  String get youLost {
    return Intl.message('You lost!', name: 'youLost', desc: '', args: []);
  }

  /// `Play again`
  String get playAgain {
    return Intl.message('Play again', name: 'playAgain', desc: '', args: []);
  }

  /// `Back to menu`
  String get backToMenu {
    return Intl.message('Back to menu', name: 'backToMenu', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Waiting for rival...`
  String get waitingForRival {
    return Intl.message(
      'Waiting for rival...',
      name: 'waitingForRival',
      desc: '',
      args: [],
    );
  }

  /// `AI will connect in {seconds} s`
  String aiWillConnectIn(Object seconds) {
    return Intl.message(
      'AI will connect in $seconds s',
      name: 'aiWillConnectIn',
      desc: '',
      args: [seconds],
    );
  }

  /// `Connect AI now`
  String get connectAiNow {
    return Intl.message(
      'Connect AI now',
      name: 'connectAiNow',
      desc: '',
      args: [],
    );
  }

  /// `Cancel AI connection`
  String get cancelAiConnection {
    return Intl.message(
      'Cancel AI connection',
      name: 'cancelAiConnection',
      desc: '',
      args: [],
    );
  }

  /// `Play with AI`
  String get playWithAi {
    return Intl.message('Play with AI', name: 'playWithAi', desc: '', args: []);
  }

  /// `vs`
  String get versus {
    return Intl.message('vs', name: 'versus', desc: '', args: []);
  }

  /// `Winner:`
  String get winner {
    return Intl.message('Winner:', name: 'winner', desc: '', args: []);
  }

  /// `Battle cancelled`
  String get battleCancelled {
    return Intl.message(
      'Battle cancelled',
      name: 'battleCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Battle ready, wait a sec.`
  String get battleReadyWait {
    return Intl.message(
      'Battle ready, wait a sec.',
      name: 'battleReadyWait',
      desc: '',
      args: [],
    );
  }

  /// `Your turn`
  String get yourTurn {
    return Intl.message('Your turn', name: 'yourTurn', desc: '', args: []);
  }

  /// `Not your turn`
  String get notYourTurn {
    return Intl.message(
      'Not your turn',
      name: 'notYourTurn',
      desc: '',
      args: [],
    );
  }

  /// `({seconds} s)`
  String secondsRemaining(Object seconds) {
    return Intl.message(
      '($seconds s)',
      name: 'secondsRemaining',
      desc: '',
      args: [seconds],
    );
  }

  /// `Failed to load locale. Please try again later.`
  String get localeLoadingError {
    return Intl.message(
      'Failed to load locale. Please try again later.',
      name: 'localeLoadingError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
