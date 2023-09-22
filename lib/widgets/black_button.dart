import '../helpers/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    Key? key,
    required this.onPressed,
    required this.hasIcon,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Function()? onPressed;
  final bool hasIcon;
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
            if (hasIcon)
              SvgPicture.asset(
                icon,
                height: 25.0,
                width: 25.0,
              ),
            if (hasIcon)
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
