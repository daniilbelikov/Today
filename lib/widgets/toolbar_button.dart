import '../helpers/constants.dart';
import 'package:flutter/material.dart';

class ToolbarButtonWidget extends StatelessWidget {
  const ToolbarButtonWidget({
    Key? key,
    required this.onPressed,
    required this.width,
    required this.title,
  }) : super(key: key);

  final void Function()? onPressed;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                TodayColors.green,
                TodayColors.purple,
              ],
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontFamily: TodayFonts.semiBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
