import '../helpers/constants.dart';
import 'package:flutter/material.dart';

class ToolbarButton extends StatelessWidget {
  const ToolbarButton({
    Key? key,
    required this.width,
    required this.onPressed,
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
