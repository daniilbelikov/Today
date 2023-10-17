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

  /// `Создать событие`
  String get create_new_event {
    return Intl.message(
      'Создать событие',
      name: 'create_new_event',
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

  /// `Выйти`
  String get exit {
    return Intl.message(
      'Выйти',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Отправить`
  String get send {
    return Intl.message(
      'Отправить',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Город события*`
  String get create_city {
    return Intl.message(
      'Город события*',
      name: 'create_city',
      desc: '',
      args: [],
    );
  }

  /// `Пример: Самара`
  String get create_city_hint {
    return Intl.message(
      'Пример: Самара',
      name: 'create_city_hint',
      desc: '',
      args: [],
    );
  }

  /// `Тип события*`
  String get create_type {
    return Intl.message(
      'Тип события*',
      name: 'create_type',
      desc: '',
      args: [],
    );
  }

  /// `Пример: Прогулка`
  String get create_type_hint {
    return Intl.message(
      'Пример: Прогулка',
      name: 'create_type_hint',
      desc: '',
      args: [],
    );
  }

  /// `Количество участников*`
  String get create_members {
    return Intl.message(
      'Количество участников*',
      name: 'create_members',
      desc: '',
      args: [],
    );
  }

  /// `Пример: 4`
  String get create_members_hint {
    return Intl.message(
      'Пример: 4',
      name: 'create_members_hint',
      desc: '',
      args: [],
    );
  }

  /// `Описание события*`
  String get create_desc {
    return Intl.message(
      'Описание события*',
      name: 'create_desc',
      desc: '',
      args: [],
    );
  }

  /// `Пример: Приглашаю сегодня прогуляться в Парке.`
  String get create_desc_value {
    return Intl.message(
      'Пример: Приглашаю сегодня прогуляться в Парке.',
      name: 'create_desc_value',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Выберите город`
  String get choose_city {
    return Intl.message(
      'Выберите город',
      name: 'choose_city',
      desc: '',
      args: [],
    );
  }

  /// `Выберите тип события`
  String get choose_type {
    return Intl.message(
      'Выберите тип события',
      name: 'choose_type',
      desc: '',
      args: [],
    );
  }

  /// `Выберите количество участников`
  String get choose_count {
    return Intl.message(
      'Выберите количество участников',
      name: 'choose_count',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get close {
    return Intl.message(
      'Закрыть',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Предупреждение`
  String get error {
    return Intl.message(
      'Предупреждение',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Успешно`
  String get success {
    return Intl.message(
      'Успешно',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Заполните профиль, прежде чем создавать события.`
  String get error_profile {
    return Intl.message(
      'Заполните профиль, прежде чем создавать события.',
      name: 'error_profile',
      desc: '',
      args: [],
    );
  }

  /// `Поздравляем, ваше событие опубликовано.`
  String get create_event_success {
    return Intl.message(
      'Поздравляем, ваше событие опубликовано.',
      name: 'create_event_success',
      desc: '',
      args: [],
    );
  }

  /// `Возраст*`
  String get age_title {
    return Intl.message(
      'Возраст*',
      name: 'age_title',
      desc: '',
      args: [],
    );
  }

  /// `Имя*`
  String get name_title {
    return Intl.message(
      'Имя*',
      name: 'name_title',
      desc: '',
      args: [],
    );
  }

  /// `Профессия или род занятий*`
  String get work_title {
    return Intl.message(
      'Профессия или род занятий*',
      name: 'work_title',
      desc: '',
      args: [],
    );
  }

  /// `О себе*`
  String get about_title {
    return Intl.message(
      'О себе*',
      name: 'about_title',
      desc: '',
      args: [],
    );
  }

  /// `Ссылка на VK*`
  String get vk_title {
    return Intl.message(
      'Ссылка на VK*',
      name: 'vk_title',
      desc: '',
      args: [],
    );
  }

  /// `Ссылка на Telegram*`
  String get telegram_title {
    return Intl.message(
      'Ссылка на Telegram*',
      name: 'telegram_title',
      desc: '',
      args: [],
    );
  }

  /// `Ваша фотография*`
  String get avatar_title {
    return Intl.message(
      'Ваша фотография*',
      name: 'avatar_title',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Пример: https://vk.com/dsbelikov`
  String get vk_hint {
    return Intl.message(
      'Пример: https://vk.com/dsbelikov',
      name: 'vk_hint',
      desc: '',
      args: [],
    );
  }

  /// `Пример: https://t.me/daniilbelikov`
  String get telegram_hint {
    return Intl.message(
      'Пример: https://t.me/daniilbelikov',
      name: 'telegram_hint',
      desc: '',
      args: [],
    );
  }

  /// `Пример: Василий`
  String get name_hint {
    return Intl.message(
      'Пример: Василий',
      name: 'name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Пример: 23`
  String get age_hint {
    return Intl.message(
      'Пример: 23',
      name: 'age_hint',
      desc: '',
      args: [],
    );
  }

  /// `Пример: Фитнес-тренер`
  String get work_hint {
    return Intl.message(
      'Пример: Фитнес-тренер',
      name: 'work_hint',
      desc: '',
      args: [],
    );
  }

  /// `Пример: Фитнес-тренер из Тольятти, который любит активный образ жизни и общение с интересными людьми. Верю в то, что можно быть в форме и без вредных привычек. Если ты также ценишь спорт и здоровый образ жизни, давай познакомимся!`
  String get about_hint {
    return Intl.message(
      'Пример: Фитнес-тренер из Тольятти, который любит активный образ жизни и общение с интересными людьми. Верю в то, что можно быть в форме и без вредных привычек. Если ты также ценишь спорт и здоровый образ жизни, давай познакомимся!',
      name: 'about_hint',
      desc: '',
      args: [],
    );
  }

  /// `Камера`
  String get camera {
    return Intl.message(
      'Камера',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Галерея`
  String get gallery {
    return Intl.message(
      'Галерея',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Ваш профиль обновлен.`
  String get edit_profile_success {
    return Intl.message(
      'Ваш профиль обновлен.',
      name: 'edit_profile_success',
      desc: '',
      args: [],
    );
  }

  /// `Выберите ваш возраст`
  String get choose_age {
    return Intl.message(
      'Выберите ваш возраст',
      name: 'choose_age',
      desc: '',
      args: [],
    );
  }

  /// `Кажется, в вашем городе нет событий. Может создадим собственное?`
  String get empty_hint {
    return Intl.message(
      'Кажется, в вашем городе нет событий. Может создадим собственное?',
      name: 'empty_hint',
      desc: '',
      args: [],
    );
  }

  /// `Вперёд!`
  String get forward {
    return Intl.message(
      'Вперёд!',
      name: 'forward',
      desc: '',
      args: [],
    );
  }

  /// `Супер!`
  String get button_super {
    return Intl.message(
      'Супер!',
      name: 'button_super',
      desc: '',
      args: [],
    );
  }

  /// `Видимо, это все события на сегодня. Что будем делать дальше?`
  String get end_text {
    return Intl.message(
      'Видимо, это все события на сегодня. Что будем делать дальше?',
      name: 'end_text',
      desc: '',
      args: [],
    );
  }

  /// `Начать заново`
  String get again {
    return Intl.message(
      'Начать заново',
      name: 'again',
      desc: '',
      args: [],
    );
  }

  /// `Сменить город`
  String get change_city {
    return Intl.message(
      'Сменить город',
      name: 'change_city',
      desc: '',
      args: [],
    );
  }

  /// `Вы не откликались на события других пользователей.`
  String get responses_empty {
    return Intl.message(
      'Вы не откликались на события других пользователей.',
      name: 'responses_empty',
      desc: '',
      args: [],
    );
  }

  /// `Вы не создавали события.`
  String get offers_empty {
    return Intl.message(
      'Вы не создавали события.',
      name: 'offers_empty',
      desc: '',
      args: [],
    );
  }

  /// `Написать в поддержку`
  String get write_support {
    return Intl.message(
      'Написать в поддержку',
      name: 'write_support',
      desc: '',
      args: [],
    );
  }

  /// `Удалить аккаунт`
  String get delete_account {
    return Intl.message(
      'Удалить аккаунт',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Вы уверены, что хотите удалить аккаунт?`
  String get delete_text {
    return Intl.message(
      'Вы уверены, что хотите удалить аккаунт?',
      name: 'delete_text',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
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
