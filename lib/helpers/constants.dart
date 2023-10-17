import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';

class TodayAssets {
  static const emptyActivity = 'assets/svg/empty_activity.svg';
  static const emptyMain = 'assets/svg/empty_main.svg';
  static const telegram = 'assets/svg/telegram.svg';
  static const authImage = 'assets/svg/auth.svg';
  static const google = 'assets/svg/google.svg';
  static const camera = 'assets/svg/camera.svg';
  static const trash = 'assets/svg/trash.svg';
  static const apple = 'assets/svg/apple.svg';
  static const end = 'assets/svg/end.svg';
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
  static const dayPattern = 'dd/MM/yyyy';
  static const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
}

class TodayLinks {
  static const privacy = 'https://belikov.dev';
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
    PickerItem(value: 'Занятие спортом'),
    PickerItem(value: 'Поход в кино'),
  ];

  static final numbers = List.generate(
    10,
    (index) => PickerItem(value: (1 + index).toString()),
  );

  static final ages = List.generate(
    52,
    (index) => PickerItem(value: (14 + index).toString()),
  );
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
  static const empty = '';
}

class TodayDecorations {
  static final shadow = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: const Color(0xffE0E0E0).withAlpha(150),
        offset: const Offset(0.0, 0.0),
        spreadRadius: 2.0,
        blurRadius: 6.0,
      ),
    ],
    borderRadius: BorderRadius.circular(20.0),
    color: Colors.white,
  );
}
