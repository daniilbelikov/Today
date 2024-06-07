import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';
import 'package:today/generated/l10n.dart';
import 'package:today/helpers/constants.dart';

extension PickerHelper on Picker {
  static Picker generatePicker({
    required String title,
    required double height,
    required BuildContext context,
    required List<PickerItem<String>>? data,
    required Function(Picker, List<int>)? onConfirm,
  }) {
    return Picker(
      height: height,
      looping: false,
      itemExtent: 38.0,
      hideHeader: true,
      onConfirm: onConfirm,
      textAlign: TextAlign.center,
      confirmText: S.of(context).done,
      cancelText: S.of(context).cancel,
      adapter: PickerDataAdapter<String>(data: data),
      cancelTextStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 16.0,
      ),
      confirmTextStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 16.0,
      ),
      textStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 18.0,
      ),
      selectedTextStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 20.0,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: TodayFonts.semiBold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
