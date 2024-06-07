import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';

class TodayAssets {
  static const emptyActivity = 'assets/svg/empty_activity.svg';
  static const telegramLogo = 'assets/svg/telegram_logo.svg';
  static const emptyMain = 'assets/svg/empty_main.svg';
  static const message = 'assets/svg/message.svg';
  static const vkLogo = 'assets/svg/vk_logo.svg';
  static const authImage = 'assets/svg/auth.svg';
  static const google = 'assets/svg/google.svg';
  static const camera = 'assets/svg/camera.svg';
  static const delete = 'assets/svg/delete.svg';
  static const trash = 'assets/svg/trash.svg';
  static const apple = 'assets/svg/apple.svg';
  static const logo = 'assets/png/logo.png';
  static const end = 'assets/svg/end.svg';
}

class TodayTexts {
  static const support = 'Обращение в техподдержку';
}

class TodayFonts {
  static const black = 'MontserratBlack';
  static const bold = 'MontserratBold';
  static const extraBold = 'MontserratExtraBold';
  static const extraLight = 'MontserratExtraLight';
  static const light = 'MontserratLight';
  static const medium = 'MontserratMedium';
  static const regular = 'MontserratRegular';
  static const semiBold = 'MontserratSemiBold';
  static const thin = 'MontserratThin';
}

class TodayColors {
  static const green = Color(0xff5FFBD6);
  static const purple = Color(0xffB063F6);
  static const text = Color(0xff252525);
}

class TodayValues {
  static const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  static const icon = '@drawable/notification_icon';
  static const dayPattern = 'dd/MM/yyyy kk:mm';
}

class TodayLinks {
  static const privacy = 'https://belikov.dev/today_privacy';
  static const path = 'dev.belikov@gmail.com';
  static const scheme = 'mailto';
}

class TodayData {
  static const selectedCity = 'Самара';
  static const citiesArray = [
    'Самара',
    'Тольятти',
    'Сызрань',
    'Новокуйбышевск',
    'Жигулёвск',
  ];

  static final cities = [
    PickerItem(value: 'Самара'),
    PickerItem(value: 'Тольятти'),
    PickerItem(value: 'Сызрань'),
    PickerItem(value: 'Новокуйбышевск'),
    PickerItem(value: 'Жигулёвск'),
  ];

  static final types = [
    PickerItem(value: 'Свидание'),
    PickerItem(value: 'Вечеринка'),
    PickerItem(value: 'Прогулка'),
    PickerItem(value: 'Пробежка'),
    PickerItem(value: 'Поход в кино'),
  ];

  static final numbers = List.generate(
    9,
    (index) => PickerItem(value: (2 + index).toString()),
  );

  static final ages = List.generate(
    52,
    (index) => PickerItem(value: (14 + index).toString()),
  );

  static final typesMap = {
    'Свидание': 0,
    'Вечеринка': 1,
    'Прогулка': 2,
    'Пробежка': 3,
    'Поход в кино': 4,
  };
}

class TodayKeys {
  static const storage = 'firebasestorage';
  static const localUser = 'localUser';
  static const avatars = 'avatars';
  static const events = 'events';
  static const count = 'count';
  static const users = 'users';
  static const user = 'user';
  static const city = 'city';
  static const type = 'type';
}

class TodayAnalytics {
  static const auth = 'auth_action';
}
