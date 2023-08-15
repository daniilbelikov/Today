import '../helpers/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontFamily: TodayFonts.medium,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
