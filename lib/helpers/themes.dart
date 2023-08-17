import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    cardColor: const Color(0xffFFFFFF),
    shadowColor: const Color(0xff252525),
    hintColor: const Color(0xff8A8A8A),
    splashColor: const Color(0xffB3ADAD),
  );
  static final dark = ThemeData.dark().copyWith(
    cardColor: const Color(0xffFFFFFF),
    shadowColor: const Color(0xff252525),
    hintColor: const Color(0xff8A8A8A),
    splashColor: const Color(0xffB3ADAD),
  );
}
