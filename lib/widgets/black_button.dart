import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';

class BlackButtonWidget extends StatelessWidget {
  const BlackButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.isActive = true,
    this.hasIcon = false,
    this.width = double.infinity,
    this.height = 48.0,
    this.icon = '',
  });

  final Function()? onPressed;
  final bool isActive;
  final bool hasIcon;
  final String title;
  final double height;
  final double width;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          disabledBackgroundColor: Theme.of(context).hintColor.withAlpha(100),
          backgroundColor: Theme.of(context).shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SvgPicture.asset(
                  icon,
                  height: 25.0,
                  width: 25.0,
                ),
              ),
            Text(
              title,
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
