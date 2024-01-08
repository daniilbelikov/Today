import '../helpers/constants.dart';
import 'package:flutter/material.dart';

class BlackTextButtonWidget extends StatelessWidget {
  const BlackTextButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.height = 48.0,
  });

  final Function()? onPressed;
  final String title;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
            Theme.of(context).splashColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).shadowColor,
            fontFamily: TodayFonts.medium,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
