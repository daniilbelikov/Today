import 'package:flutter/material.dart';

class TodayAssets {
  static const authImage = 'assets/svg/auth.svg';
  static const google = 'assets/svg/google.svg';
  static const apple = 'assets/svg/apple.svg';
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
}

class TodayValues {
  static const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
}

class TodayLinks {
  static const privacy = 'https://belikov.dev';
}

class TodayData {
  static const selectedValue = 'Тольятти';
  static const values = ['Тольятти', 'Самара'];
  static const samaraOld = 'Самара';
  static const samaraNew = 'Самаре';
}

class TodayKeys {
  static const events = 'events';
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
