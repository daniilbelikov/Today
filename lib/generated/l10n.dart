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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Всё случится\nСЕГОДНЯ`
  String get auth_title {
    return Intl.message(
      'Всё случится\nСЕГОДНЯ',
      name: 'auth_title',
      desc: '',
      args: [],
    );
  }

  /// `Войти через Google`
  String get google {
    return Intl.message(
      'Войти через Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Войти через Apple`
  String get apple {
    return Intl.message(
      'Войти через Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `Осуществляя вход, вы соглашаетесь с`
  String get privacy_title {
    return Intl.message(
      'Осуществляя вход, вы соглашаетесь с',
      name: 'privacy_title',
      desc: '',
      args: [],
    );
  }

  /// `Политикой конфиденциальности`
  String get privacy_subtitle {
    return Intl.message(
      'Политикой конфиденциальности',
      name: 'privacy_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `События`
  String get events {
    return Intl.message(
      'События',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Активность`
  String get activity {
    return Intl.message(
      'Активность',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Создать`
  String get create {
    return Intl.message(
      'Создать',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Отклики`
  String get responses {
    return Intl.message(
      'Отклики',
      name: 'responses',
      desc: '',
      args: [],
    );
  }

  /// `Предложения`
  String get offers {
    return Intl.message(
      'Предложения',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Варианты в `
  String get variants {
    return Intl.message(
      'Варианты в ',
      name: 'variants',
      desc: '',
      args: [],
    );
  }

  /// `Выберите город`
  String get chooseCity {
    return Intl.message(
      'Выберите город',
      name: 'chooseCity',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get done {
    return Intl.message(
      'Готово',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Создание`
  String get create_event {
    return Intl.message(
      'Создание',
      name: 'create_event',
      desc: '',
      args: [],
    );
  }

  /// `Редактирование`
  String get edit_profile {
    return Intl.message(
      'Редактирование',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Выйти из аккаунта`
  String get exit {
    return Intl.message(
      'Выйти из аккаунта',
      name: 'exit',
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
